# frozen_string_literal: true

class Context::PurchasePreference
  include Interactor

  def call
    context.dir        = 'nsiPurchasePreferences'
    context.model      = NsiPurchasePreference
    context.to_value   = lambda do |node|
      {
          id:     node['id'],
          name:   node['name'],
          actual: node['actual'],
          data:   node
      }
    end
    context.nodes_from = ->(xml) { xml['export']['nsiPurchasePreferenceList']['nsiPurchasePreference'] }
  end
end
