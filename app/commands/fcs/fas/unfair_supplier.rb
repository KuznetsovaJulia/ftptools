# frozen_string_literal: true

class Fcs::Fas::UnfairSupplier
  include Interactor

  def call
    context.dir        = 'unfairSupplier'
    context.path       = '/fcs_fas/'
    context.model      = FasUnfairSupplier
    context.to_value   = lambda do |node|
      {
          registry_num: node['registryNum'],
          publish_date: (node['publishDate'].to_date unless node['publishDate'].nil?),
          approve_date: (node['approveDate'].to_date unless node['approveDate'].nil?),
          state:        node['state'],
          full_name:    node.dig('unfairSupplier', 'fullName'),
          firm_name:    node.dig('unfairSupplier', 'firmName'),
          inn:          node.dig('unfairSupplier', 'inn'),
          data:         node
      }
    end
    context.nodes_from = ->(xml) { xml['export']['unfairSupplier'] }
  end
end