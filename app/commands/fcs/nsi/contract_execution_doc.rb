# frozen_string_literal: true

class Fcs::Nsi::ContractExecutionDoc
  include Interactor

  def call
    context.dir = 'nsiContractExecutionDoc'
    context.path       = '/fcs_nsi/'
    context.model = NsiContractExecutionDoc
    context.to_value = lambda do |node|

      {
          name: node['name'],
          actual: node['actual'],
          code: node['code'],
          data: node
      }
    end
    context.nodes_from = ->(xml) { xml['export']['nsiContractExecutionDoc']['nsiContractExecutionDoc'] }
  end
end
