# frozen_string_literal: true

class Fcs::Nsi::Oksm
  include Interactor

  def call
    context.dir = 'nsiOKSM'
    context.path       = '/fcs_nsi/'
    context.model = NsiOksm
    context.to_value = lambda do |node|

      {
          country_code: node['countryCode'],
          country_full_name: node['countryFullName'],
          actual: node['actual'],
          data: node
      }
    end
    context.nodes_from = ->(xml) { xml['export']['nsiOKSMList']['nsiOKSM'] }
  end
end
