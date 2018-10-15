# frozen_string_literal: true




class Context::Okpd2
include Interactor

  def call
    context.dir = 'nsiOKPD2'
    context.model = NsiOkpd2
    context.to_value = lambda do |node|
      {
          id: node['id'].to_i,
          parent_id: node['parentId'].to_i,
          code: node['code'],
          parent_code: node['parentCode'],
          name: node['name'],
          actual: node['actual'],
          comment: node['comment'],
          data: node,
      }
    end

    context.nodes_from = ->(xml) { xml['export']['nsiOKPD2List']['nsiOKPD2'] }
  end
end
