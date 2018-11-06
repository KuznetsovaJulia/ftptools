# frozen_string_literal: true
# Справочник причин начисления неустоек (штрафов, пеней)

class Fcs::Nsi::ContractPenaltyReason
  include Interactor

  def call
    context.dir = 'nsiContractPenaltyReason'
    context.path       = '/fcs_nsi/'
    context.model = NsiContractPenaltyReason
    context.to_value = lambda do |node|

      {
          name: node['name'],
          actual: node['actual'],
          code: node['code'],
          penalty_type: node['penaltyType'],
          data: node
      }
    end
    context.nodes_from = ->(xml) { xml['export']['nsiContractPenaltyReason']['nsiContractPenaltyReason'] }
  end
end
