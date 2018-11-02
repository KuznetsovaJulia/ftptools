# frozen_string_literal: true
# Справочник оснований признания процедуры несостоявшейся
class Fcs::Nsi::AbandonedReason
  include Interactor

  def call
    context.dir        = 'nsiAbandonedReason'
    context.path       = '/fcs_nsi/'
    context.model      = NsiAbandonedReason
    context.to_value   = lambda do |node|

      {
          id:   node['id'].to_i,
          name: node['name'],
          code: node['code'],
          data: node
      }
    end
    context.nodes_from = ->(xml) { xml['export']['nsiAbandonedReasonList']['nsiAbandonedReason'] }
  end
end
