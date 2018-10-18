# frozen_string_literal: true

class Context::TenderPlan2017ContractLifeCycleCase
  include Interactor

  def call
    context.dir        = 'nsiTenderPlan2017ContractLifeCycleCase'
    context.model      = NsiTenderPlan2017ContractLifeCycleCase
    context.to_value   = lambda do |node|

      {
          id:   node['id'],
          actual: node['actual'],
          code: node['code'],
          data: node
      }
    end
    context.nodes_from = ->(xml) { xml['export']['nsiTenderPlan2017ContractLifeCycleCases']['nsiTenderPlan2017ContractLifeCycleCase'] }
  end
end
