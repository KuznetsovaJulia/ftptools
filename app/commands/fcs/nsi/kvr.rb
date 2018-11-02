# frozen_string_literal: true
# Коды видов расходов (КВР)

class Fcs::Nsi::Kvr
  include Interactor

  def call
    context.dir        = 'nsiKVR'
    context.path       = '/fcs_nsi/'
    context.model      = NsiKvr
    context.to_value   = lambda do |node|

      {
          code:        node['code'],
          actual:      node['actual'],
          data:        node
      }
    end
    context.nodes_from = ->(xml) { xml['export']['nsiKVRList']['nsiKVR'] }
  end
end
