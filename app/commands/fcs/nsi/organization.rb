# frozen_string_literal: true

class Fcs::Nsi::Organization
  include Interactor

  def call
    context.dir        = 'nsiOrganization'
    context.path       = '/fcs_nsi/'
    context.model      = NsiOrganization
    context.to_value   = lambda do |node|

      {
          reg_number: node['regNumber'],
          full_name:  node['fullName'],
          inn:        node['INN'],
          kpp:        node['KPP'],
          ogrn:       node['OGRN'],
          data:       node
      }
    end
    context.nodes_from = ->(xml) { xml['export']['nsiOrganizationList']['nsiOrganization'] }
  end
end
