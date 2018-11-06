# frozen_string_literal: true
# Типы организаций

class Fcs::Nsi::OrganizationType
  include Interactor

  def call
    context.dir = 'nsiOrganizationType'
    context.path       = '/fcs_nsi/'
    context.model = NsiOrganizationType
    context.to_value = lambda do |node|

      {
          code: node['code'],
          name: node['name'],
          data: node
      }
    end
    context.nodes_from = ->(xml) { xml['export']['nsiOrganizationTypesList']['nsiOrganizationType'] }
  end
end
