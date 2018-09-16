class FtpLoad
  require 'net/ftp'
  require 'zip'
  require 'tmpdir'
  require 'tempfile'
  include Interactor
  def call
    # выполняю соединение с FTP
    ftp = Net::FTP.open('ftp.zakupki.gov.ru', 'free', 'free')
    # в files записываю массив имён файлов и вывожу пока список файлов для поверки
    files = ftp.nlst("/fcs_fas/unfairSupplier")
    puts files
    # создаю временный файл
    local_tmp_file = Tempfile.new(File.basename(files[2]))

    #во временный файл сохраняю удалённый
    ftp.getbinaryfile(files[2],local_tmp_file)

    ftp.close
    @temp_dir = Dir.mktmpdir(File.basename(files[2]))

    Zip::File.open(local_tmp_file) do |zip_file|

      # Handle entries one by one
      zip_file.each do |entry|
        # Extract to file/directory/symlink
        puts "Extracting #{entry.name}"
        puts @temp_dir
        dest_file = File.join(@temp_dir, entry.name)
        entry.extract(dest_file)

        # Read into memory
        content = entry.get_input_stream.read
        content=Hash.from_xml(content)
        puts content
      end

    end
  end

end
