# frozen_string_literal: true

class Nsi::SingleCustomerReason::Synchronize::SetContext
  include Interactor

  def call
    context.dir = 'nsiContractSingleCustomerReason'
    context.model = NsiSingleCustomerReason
    context.to_value = lambda do |node|
      return nil unless node['subsystemType'] == 'FZ44'

      {
        name: node['name'],
        actual: node['actual'],
        data: node,
        single_customer_reason_id: node['id'].to_i
      }
    end
    context.nodes_from = ->(xml) { xml['export']['nsiContractSingleCustomerReasonList']['nsiContractSingleCustomerReason'] }
  end
end
