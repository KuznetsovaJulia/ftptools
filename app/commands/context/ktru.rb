class Context::Ktru
  include Interactor

  def call
    context.dir = 'nsiKTRU'
    context.model = NsiKtru
    context.to_value = lambda do |node|
      {
          code: node['code'],
          version: node['version'].to_i,
          inclusion_date: node['inclusionDate'],
          publish_date: node['publishDate'],
          name: node['name'],
          okpd2_code: node.dig('OKPD2', 'code'),
          actual: (node['actual'] == 'true'),
          application_date_start: node['applicationDateStart'],
          description: node['nsiDescription'],
          external_code: node['externalCode'],
          parent_code: node.dig('parentPositionInfo', 'code'),
          data: node
      }
    end
    context.nodes_from = ->(xml) { xml['export']['nsiKTRUs']['position'] }
  end
end