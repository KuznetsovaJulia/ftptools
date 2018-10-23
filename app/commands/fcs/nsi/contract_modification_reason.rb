# frozen_string_literal: true

class Fcs::Nsi::ContractModificationReason
  include Interactor

  def call
    context.dir = 'nsiContractModificationReason'
    context.path       = '/fcs_nsi/'
    context.model = NsiContractModificationReason
    context.to_value = lambda do |node|

      {
          name: node['name'],
          actual: node['actual'],
          code: node['code'],
          data: node
      }
    end
    context.nodes_from = ->(xml) { xml['export']['nsiContractModificationReason']['nsiContractModificationReason'] }
  end
end
