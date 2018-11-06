# frozen_string_literal: true
# Справочник: Роли членов комиссий
class Fcs::Nsi::CommissionRole
  include Interactor

  def call
    context.dir        = 'nsiCommissionRole'
    context.path       = '/fcs_nsi/'
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
