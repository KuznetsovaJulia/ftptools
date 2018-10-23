# frozen_string_literal: true

class Fcs::Nsi::TenderPlan2017PositionChangeReason
  include Interactor

  def call
    context.dir        = 'nsiTenderPlan2017PositionChangeReason'
    context.path       = '/fcs_nsi/'
    context.model      = NsiTenderPlan2017PositionChangeReason
    context.to_value   = lambda do |node|

      {
          id:   node['id'],
          actual: node['actual'],
          code: node['code'],
          data: node
      }
    end
    context.nodes_from = ->(xml) { xml['export']['nsiTenderPlan2017PositionChangeReasons']['nsiTenderPlan2017PositionChangeReason'] }
  end
end
