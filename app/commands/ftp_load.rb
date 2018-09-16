require 'net/ftp'
class FtpLoad
  include Interactor
  CONTENT_SERVER_DOMAIN_NAME = 'ftp.zakupki.gov.ru'
  CONTENT_SERVER_FTP_LOGIN = 'free'
  CONTENT_SERVER_FTP_PASSWORD = 'free'

  def call
      puts 'тест'
    # Net::FTP.open(CONTENT_SERVER_DOMAIN_NAME, CONTENT_SERVER_FTP_LOGIN, CONTENT_SERVER_FTP_PASSWORD) { |ftp|
    #   files = ftp.list("/fcs_fas/unfairSupplier/")
    #   ftp.getbinaryfile('unfairSupplier_2018062900_2018063000_001.xml.zip')
    #   puts files
    #
    # }

  end
end
