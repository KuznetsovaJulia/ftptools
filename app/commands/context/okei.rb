# frozen_string_literal: true




class Context::Okei
include Interactor

  def call
    context.dir = 'nsiOKEI'
    context.model = NsiOkei
    context.to_value = lambda do |node|
      {
          code: node['code'],
          fullname: node['fullName'],
          section_code: node.dig('section','code'),
          section_name: node.dig('section','name'),
          group_id: node.dig('group','id'),
          group_name: node.dig('group','name'),
          local_name: node['localName'],
          international_name: node['internationalName'],
          local_symbol: node['localSymbol'],
          international_symbol: node['internationalSymbol'],
          actual: node['actual'],
          is_temporaryfor_ktru: node['isTemporaryForKTRU'],
          data: node,
      }
    end

    context.nodes_from = ->(xml) { xml['export']['nsiOKEIList']['nsiOKEI'] }
  end
end
