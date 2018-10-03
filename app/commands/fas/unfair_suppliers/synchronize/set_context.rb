# frozen_string_literal: true

class Fas::UnfairSuppliers::Synchronize::SetContext
  include Interactor

  def call
    context.dir = 'unfairSupplier'
    context.model= UnfairSupplier
    context.to_value = lambda do |node|
      node = node
      if node['state']=="PUBLISHED"||"ON_EXCLUSION"
        {
              loaded_unfair_supplier_id: context.unfair_supplier_id,
              registry_num: node['registryNum'],
              publish_date: node['publishDate'].to_date,
              approve_date: (
              if node['approveDate']==nil
              else
                node['approveDate'].to_date
              end),
              state: node['state'],
              full_name: node.dig('unfairSupplier','fullName'),
              view: node.dig('unfairSupplier','type'),
              firm_name: node.dig('unfairSupplier','firmName'),
              inn: node.dig('unfairSupplier','inn'),
              data: node
        }
      else
        context.fail!
      end
    end
    context.nodes_from = ->(xml) { xml['export']['unfairSupplier']}
  end

end
