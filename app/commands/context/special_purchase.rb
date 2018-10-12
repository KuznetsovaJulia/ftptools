# frozen_string_literal: true

class Context::SpecialPurchase
  include Interactor

  def call
    context.dir = 'nsiSpecialPurchase'
    context.model = NsiSpecialPurchase
    context.to_value = lambda do |node|
      {
        code: node['code'],
        actual: node['actual'],
        short_name: node['purchasePlanShortName'],
        full_name: node['purchasePlanFullName'],
        data: node,
        tender_plan2017_short: node['tenderPlan2017ShortName'],
        tender_plan_2017_full: node['tenderPlan2017FullName'],
        special_purchase_id: node['id'].to_i
      }
    end
    context.nodes_from = ->(xml) { xml['export']['nsiSpecialPurchases']['nsiSpecialPurchase'] }
  end
end
