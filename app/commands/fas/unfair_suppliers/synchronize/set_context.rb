# frozen_string_literal: true

class Fas::UnfairSuppliers::Synchronize::SetContext
  include Interactor

  def call
    context.dir        = 'unfairSupplier'
    context.path       = '/fcs_fas/'
    context.model      = UnfairSupplier
    context.to_value   = lambda do |node|
      {
        loaded_unfair_supplier_id: context.unfair_supplier_id,
        id: node.dig('unfairSupplier', 'inn'),
        registry_num:              node['registryNum'],
        publish_date:              (node['publishDate'].to_date unless node['publishDate'].nil?),
        approve_date:              (node['approveDate'].to_date unless node['approveDate'].nil?),
        state:                     node['state'],
        full_name:                 node.dig('unfairSupplier', 'fullName'),
        view:                      node.dig('unfairSupplier', 'type'),
        firm_name:                 node.dig('unfairSupplier', 'firmName'),
        inn:                       node.dig('unfairSupplier', 'inn'),
        data:                      node
      }
    end
    context.nodes_from = ->(xml) { xml['export']['unfairSupplier'] }
    context.ftp = FtpDownload.new(context.path, context.dir)
  end
end