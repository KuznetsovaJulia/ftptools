# frozen_string_literal: true

class Context::CommissionRole
  include Interactor

  def call
    context.dir        = 'nsiCommissionRole'
    context.model      = NsiCommissionRole
    context.to_value   = lambda do |node|

      {
          id: node['id'],
          name:  node['name'],
          code:        node['code'],
          data:       node
      }
    end
    context.nodes_from = ->(xml) { xml['export']['nsiCommissionRoleList']['nsiCommissionRole'] }
  end
end
