# frozen_string_literal: true
# Обоснования внесения изменений в позицию плана закупок

class Fcs::Nsi::PurchasePlanPositionChangeReason
  include Interactor

  def call
    context.dir = 'nsiPurchasePlanPositionChangeReason'
    context.path       = '/fcs_nsi/'
    context.model = NsiPurchasePlanPositionChangeReason
    context.to_value = lambda do |node|
      {
          code: node['code'],
          actual: node['actual'],
          short_name: node['shortName'],
          description: node['description'],
          data: node,
          legal_act_details: node['legalActDetails'],
          id: node['id'].to_i
      }
    end
    context.nodes_from = ->(xml) { xml['export']['nsiPurchasePlanPositionChangeReasons']['nsiPurchasePlanPositionChangeReason'] }
  end
end
