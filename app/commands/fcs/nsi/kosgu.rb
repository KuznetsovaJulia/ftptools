# frozen_string_literal: true
# Классификатор кодов сектора государственного управления (КОСГУ)

class Fcs::Nsi::Kosgu
  include Interactor

  def call
    context.dir        = 'nsiKOSGU'
    context.path       = '/fcs_nsi/'
    context.model      = NsiKosgu
    context.to_value   = lambda do |node|

      {
          code:   node['code'],
          actual: node['actual'],
          data:   node
      }
    end
    context.nodes_from = ->(xml) { xml['export']['nsiKOSGUList']['nsiKOSGU'] }
  end
end
