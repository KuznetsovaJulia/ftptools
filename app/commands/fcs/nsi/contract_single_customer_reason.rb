# frozen_string_literal: true

class Fcs::Nsi::ContractSingleCustomerReason
  include Interactor

  def call
    context.dir = 'nsiContractSingleCustomerReason'
    context.path       = '/fcs_nsi/'
    context.model = NsiContractSingleCustomerReason
    context.to_value = lambda do |node|
      return nil unless node['subsystemType'] == 'FZ44'

      {
        name: node['name'],
        code: node['code'],
        actual: node['actual'],
        data: node,
        id: node['id'].to_i
      }
    end
    context.nodes_from = ->(xml) { xml['export']['nsiContractSingleCustomerReasonList']['nsiContractSingleCustomerReason'] }
  end
end
