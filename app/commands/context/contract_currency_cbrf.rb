# frozen_string_literal: true

class Context::ContractCurrencyCbrf
  include Interactor

  def call
    context.dir = 'nsiContractCurrencyCBRF'
    context.model = NsiContractCurrencyCbrf
    context.to_value = lambda do |node|

      {
          code: node.dig('currency','code'),
          actual: node['actual'],
          data: node
      }
    end
    context.nodes_from = ->(xml) { xml['export']['nsiContractCurrencyCBRF']['nsiContractCurrencyCBRF'] }
  end
end
