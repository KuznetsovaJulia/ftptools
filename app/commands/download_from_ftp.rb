# Сервисный класс загружающий с ftp заданные файлы. Помещает в контекст files - массив строк с полным путем к загруженному файлу


class DownloadFromFtp
  include Interactor
  require 'net/ftp'
  require 'fileutils'
  # @return [Array] Массив строк - абсолютных путей к загруженным файлам
  # context:
  # - dir - обязательный на входе - намиенование дирректории ftp в которой лежат файлы справочника
  # - files - генерируемый контекст

  def call
    dirname = Rails.root.join("tmp", context.dir).to_s
    # --- удаляем из папки все существующие файлы
    FileUtils.rm_rf(Rails.root.join('tmp', context.dir)) if File.directory?(dirname)
    # --- создаем директорию
    FileUtils.mkdir_p(dirname)
    # --- получаем массив имен файлов архивов
    filenames = ftp.nlst('*.zip')
    context.files=[]
    filenames.each_with_index do |filename, index|
      file_abspath = Rails.root.join(dirname, filename)
      print("%-3d %s ...\t" % [index+1, filename])
      begin
        ftp.getbinaryfile(filename, file_abspath)
      rescue Net::FTPTempError => e
        puts e
        puts "Reconnect and retry..."
        reconnect
        retry
      end
      context.files << file_abspath
    end
    context.files
  end

  private

  def ftp
    @ftp ||= connect
  end

  def connect
    @ftp = Net::FTP.new("ftp.zakupki.gov.ru", "free","free")
    @ftp.chdir('/fcs_nsi/' + context.dir)
    @ftp.passive = true
    @ftp
  end

  def reconnect
    @ftp.close
    @ftp = nil
    sleep 1
    connect
  end
end
