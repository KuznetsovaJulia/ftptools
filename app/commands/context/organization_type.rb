# frozen_string_literal: true

class Context::OrganizationType
  include Interactor

  def call
    context.dir = 'nsiOrganizationType'
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
