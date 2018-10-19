# frozen_string_literal: true

class Context::Okopf
  include Interactor

  def call
    context.dir        = 'nsiOKOPF'
    context.model      = NsiOkopf
    context.to_value   = lambda do |node|

      {
          parent_code: node['parentCode'],
          code:        node['code'],
          actual:      node['actual'],
          data:        node
      }
    end
    context.nodes_from = ->(xml) { xml['export']['nsiOKOPFList']['nsiOKOPF'] }
  end
end
