# frozen_string_literal: true

class Nsi::SingleCustomerReason::Synchronize
  # Сервисный объект предназначенный для синхронизации справочника КТРУ
  # Загрузка возможна как с ftp так и с локальной папки
  # возможные параметры load_from: :files, загрузка из файлов, при этом необходимо так же задать массив строк files
  include Interactor

  def call
    SetContext.call context
    Nsi::DownloadFromFtp.call(context) unless context.load_from == :files
    # --- если есть что загружать - помечаем все записи в таблице как неактуальные
    Nsi::LoadFromFiles.call(context)
  end
end
