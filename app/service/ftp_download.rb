require 'net/ftp'

class FtpDownload
  LOGIN    = 'free'.freeze
  PASSWORD = 'free'.freeze
  FTP_PATH = 'ftp.zakupki.gov.ru'.freeze
  attr_accessor :path, :dir

  def initialize(path, dir)
    self.dir  = dir
    self.path = path
  end

  def connect
    @ftp = Net::FTP.new(FTP_PATH, LOGIN, PASSWORD)
    @ftp.chdir(path + dir)
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