# frozen_string_literal: true
# Общероссийский классификатор продукции по видам экономической деятельности ОК 034-2014 (ОКПД2)

class Fcs::Nsi::Okpd2
include Interactor

  def call
    context.dir = 'nsiOKPD2'
    context.path       = '/fcs_nsi/'
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
