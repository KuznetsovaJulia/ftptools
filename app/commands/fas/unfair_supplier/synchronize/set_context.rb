# frozen_string_literal: true

class Fas::UnfairSupplier::Synchronize::SetContext
  include Interactor

  def call
    context.dir = 'unfairSupplier'
    context.to_value = lambda do |node|
      node = node['data']
      {
        registry_num: node['registryNum'],
        publish_date: node['publishDate'].to_i,
        approve_date: node['approveDate'],
        state: node['state'],
        full_name: node.dig('unfairSupplier','fullName'),
        type: node.dig('unfairSupplier','type'),
        firm_name: node.dig('unfairSupplier','firmName'),
        inn: node.dig('unfairSupplier','inn'),
        actual: (node['actual'] == 'true'),
        data: node
      }
    end
    context.nodes_from = ->(xml) { xml['export']['unfairSupplier']}
  end
end
