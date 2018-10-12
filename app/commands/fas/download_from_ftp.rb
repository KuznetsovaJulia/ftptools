# frozen_string_literal: true

# Сервисный класс загружающий с ftp заданные файлы. Помещает в контекст files - массив строк с полным путем к загруженному файлу
class Fas::DownloadFromFtp
  include Interactor
  # require 'net/ftp'
  require 'fileutils'
  require 'zip'
  # @return [Array] Массив строк - абсолютных путей к загруженным файлам
  # context:
  # - dir - обязательный на входе - намиенование дирректории ftp в которой лежат файлы справочника
  # - files - генерируемый контекст
  def call
    dirname = Rails.root.join('tmp', context.dir).to_s
    # --- удаляем из папки все существующие файлы
    FileUtils.rm_rf(Rails.root.join('tmp', context.dir)) if File.directory?(dirname)
    # --- создаем директорию
    FileUtils.mkdir_p(dirname)
    # --- получаем массив имен файлов архивов
     lastfile      = ''
     lastfile      = LoadedUnfairSupplier.maximum(:number) if LoadedUnfairSupplier.all.size > 0
     filenames     = ftp.nlst(context.dir + '*.zip').find_all { |file| file.scan(/\d+/)[1, 2].join > lastfile }
    context.files = []
    filenames.each_with_index do |filename, index|
      file_abspath = Rails.root.join(dirname, filename)
      print(format("%-3d %s ...\t", index + 1, filename))
      context.file_name   = filename
      context.number = filename.scan(/\d+/)[1, 2].join
      begin
        ftp.getbinaryfile(filename, file_abspath)
      rescue Net::FTPTempError => e
        puts e
        puts 'Reconnect and retry...'
        reconnect
        retry
      end
      context.file = file_abspath
      context.files_array = []
      Zip::File.open(file_abspath) do |zip_file|
        zip_file.each do |entry|
          context.files_array << entry.name if entry.name.include?('.xml')
        end
      end
      # Fas::UnfairSuppliers::CreateLoadedUnfairSupplier.call(context)
    end
    context.files
  end

  private

  def ftp
    @ftp ||= context.ftp.connect
  end
  #
  # def connect
  #   @ftp = Net::FTP.new('ftp.zakupki.gov.ru', 'free', 'free')
  #   @ftp.chdir('/fcs_fas/' + context.dir)
  #   @ftp.passive = true
  #   @ftp
  # end
  #
  # def reconnect
  #   @ftp.close
  #   @ftp = nil
  #   sleep 1
  #   connect
  # end
end
