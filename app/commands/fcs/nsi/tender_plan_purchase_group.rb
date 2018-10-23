# frozen_string_literal: true

class Fcs::Nsi::TenderPlanPurchaseGroup
  include Interactor

  def call
    context.dir        = 'nsiTenderPlanPurchaseGroup'
    context.path       = '/fcs_nsi/'
    context.model      = NsiTenderPlanPurchaseGroup
    context.to_value   = lambda do |node|

      {
          id:   node['id'],
          actual: node['actual'],
          code: node['code'],
          data: node
      }
    end
    context.nodes_from = ->(xml) { xml['export']['nsiTenderPlanPurchaseGroups']['nsiTenderPlanPurchaseGroup'] }
  end
end
