# frozen_string_literal: true

class Context::PurchaseRejectReason
  include Interactor

  def call
    context.dir        = 'nsiPurchaseRejectReason'
    context.model      = NsiPurchaseRejectReason
    context.to_value   = lambda do |node|
      return nil unless node['subsystemType'] == 'FZ44'
      {
          id:   node['id'],
          code: node['code'],
          actual: node['actual'],
          data: node
      }
    end
    context.nodes_from = ->(xml) { xml['export']['nsiPurchaseRejectReasonList']['nsiPurchaseRejectReason'] }
  end
end
