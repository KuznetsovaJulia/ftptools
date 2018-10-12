# frozen_string_literal: true

class Synchronize
  # Сервисный объект предназначенный для синхронизации справочника КТРУ
  # Загрузка возможна как с ftp так и с локальной папки
  # возможные параметры load_from: :files, загрузка из файлов, при этом необходимо так же задать массив строк files
  include Interactor::Organizer

  organize DownloadFromFtp, LoadFromFiles


end
