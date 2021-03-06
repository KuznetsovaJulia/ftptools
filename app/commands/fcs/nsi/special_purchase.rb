# frozen_string_literal: true
# Типы особых закупок для планов закупок и планов-графиков с 01.01.2017

class Fcs::Nsi::SpecialPurchase
  include Interactor

  def call
    context.dir = 'nsiSpecialPurchase'
    context.path       = '/fcs_nsi/'
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
        id: node['id'].to_i
      }
    end
    context.nodes_from = ->(xml) { xml['export']['nsiSpecialPurchases']['nsiSpecialPurchase'] }
  end
end
