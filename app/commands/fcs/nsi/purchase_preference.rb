# frozen_string_literal: true
# Преимущества (требования, ограничения)  при осуществлении закупок

class Fcs::Nsi::PurchasePreference
  include Interactor

  def call
    context.dir        = 'nsiPurchasePreferences'
    context.path       = '/fcs_nsi/'
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
