class Fcs::Nsi::Ktru
  include Interactor

  def call
    context.dir        = 'nsiKTRU'
    context.path       = '/fcs_nsi/'
    context.model      = NsiKtru
    context.to_value   = lambda do |node|
      {
          code:    node.dig('data', 'code'),
          name:    node.dig('data', 'name'),
          actual:  node.dig('data', 'actual'),
          data:    node
      }
    end
    context.nodes_from = ->(xml) { xml['export']['nsiKTRUs']['position'] }
  end
end