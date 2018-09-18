# frozen_string_literal: true

class Fas::UnfairSupplier::Synchronize
  # Сервисный объект предназначенный для синхронизации справочника недобросовестных поставщиков
  # Загрузка возможна как с ftp так и с локальной папки
  # возможные параметры load_from: :files, загрузка из файлов, при этом необходимо так же задать массив строк files
  include Interactor

  def call
    SetContext.call context
    Fas::DownloadFromFtp.call(context) unless context.load_from == :files
    # --- если есть что загружать - помечаем все записи в таблице как неактуальные
    return unless context.files.empty?
    context.model.update_all(actual: false)
    Fas::LoadFromFiles.call(context)
  end
end
