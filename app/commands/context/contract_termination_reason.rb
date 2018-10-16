# frozen_string_literal: true

class Context::ContractTerminationReason
  include Interactor

  def call
    context.dir = 'nsiContractTerminationReason'
    context.model = NsiContractTerminationReason
    context.to_value = lambda do |node|
      return nil unless node['subsystemType'] == 'FZ44'

      {
          name: node['name'],
          actual: node['actual'],
          code: node['code'],
          data: node,
          id: node['id'].to_i
      }
    end
    context.nodes_from = ->(xml) { xml['export']['nsiContractTerminationReason']['nsiContractTerminationReason'] }
  end
end
