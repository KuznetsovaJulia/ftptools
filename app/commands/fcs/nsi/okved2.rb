# frozen_string_literal: true

class Fcs::Nsi::Okved2
  include Interactor

  def call
    context.dir        = 'nsiOKVED2'
    context.path       = '/fcs_nsi/'
    context.model      = NsiOkved2
    context.to_value   = lambda do |node|

      {
          id:   node['id'],
          name: node['name'],
          actual: node['actual'],
          code: node['code'],
          data: node
      }
    end
    context.nodes_from = ->(xml) { xml['export']['nsiOKVED2List']['nsiOKVED2'] }
  end
end
