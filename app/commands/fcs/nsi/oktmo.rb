# frozen_string_literal: true
#Общероссийский классификатор территорий муниципальных образований (ОКТМО)

class Fcs::Nsi::Oktmo
include Interactor

  def call
    context.dir = 'nsiOKTMO'
    context.path       = '/fcs_nsi/'
    context.model = NsiOktmo
    context.to_value = lambda do |node|
      {
        code: node['code'],
        parent_code: node['parentCode'],
        fullname: node['fullname'],
        actual: node['actual'],
        data: node,
        section: node['section'],
        last_update_date: (node['lastUpdateDate'].to_date unless node['lastUpdateDate'].nil?)
      }
    end



    context.nodes_from = ->(xml) { xml['export']['nsiOKTMOList']['nsiOKTMO'] }
  end
end
