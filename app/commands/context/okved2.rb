# frozen_string_literal: true

class Context::Okved2
  include Interactor

  def call
    context.dir        = 'nsiOKVED2'
    context.model      = NsiOkved2
    context.to_value   = lambda do |node|

      {
          id:   node['id'],
          name: node['name'],
          code: node['code'],
          data: node
      }
    end
    context.nodes_from = ->(xml) { xml['export']['nsiOKVED2List']['nsiOKVED2'] }
  end
end
