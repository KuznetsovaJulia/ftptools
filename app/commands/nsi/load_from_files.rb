# Сервисный объект загрузки данных из файла в модель
# В контексте должны быть:
#  - files - массив строк с абсолютными путями к загруженным файлам
#  - model - модель, в которую надо загружать данные
#  - to_value - лямбда-функция формирующая хэш для обновления данных в модели

require 'fileutils'
require 'zip'

class Nsi::LoadFromFiles
  include Interactor

  def call
    total = 0
puts context.files
    context.files.each do |zip_abspath|
      unzip_file(zip_abspath, /^*.xml/) do |filename, content|
        print("\t#{filename}\n")
        # --- получаем данные XML
        # xml = Nori.new(strip_namespaces: true, advanced_typecasting: false).parse(content)
        xml = Hash.from_xml(content)
        # --- получаем массив записей справочника
        nodes = context.nodes_from.call(xml)
        # --- перебираем все XML узлы
        # по атрибутам по которым ведется upsert должен быть построен уникальный ключ
        values = nodes.map { |node| context.to_value.call(node) }.compact
        context.model.upsert(values)
        total += values.size
        puts xml
      end
    end
    print("Всего загружено записей: #{total}\n")
  end

  private

  # Распаковка архива и перебор файлов с заднным шаблоном
  # @param zip_abspath [String] абсолютный путь к архиву
  # @param pattern [RegExp] шаблон имени файлов в архиве, по умолчанию nil
  # @yield entryname, content [String, String] имя и содержимое файла
  def unzip_file(zip_abspath, pattern = nil)
    Zip::File.open(zip_abspath) do |zip_file|
      zip_file.each do |entry|
        # --- entry - это заархивированный файл
        # --- если определен шаблон и entry под него не попадает,
        #     то пропускаем его
        next if pattern && !pattern.match(entry.to_s)
        # --- выводим контент файла
        yield [entry.name, entry.get_input_stream.read]
      end
    end
  end
end
