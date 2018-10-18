# frozen_string_literal: true

class Context::AbandonedReason
  include Interactor

  def call
    context.dir        = 'nsiAbandonedReason'
    context.model      = NsiAbandonedReason
    context.to_value   = lambda do |node|

      {
          id:   node['id'],
          name: node['name'],
          code: node['code'],
          data: node
      }
    end
    context.nodes_from = ->(xml) { xml['export']['nsiAbandonedReasonList']['nsiAbandonedReason'] }
  end
end
