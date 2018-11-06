# frozen_string_literal: true
# Справочник организаций

class Fcs::Nsi::Organization
  include Interactor

  def call
    context.dir        = 'nsiOrganization'
    context.path       = '/fcs_nsi/'
    context.model      = TestOrganization
    context.to_value   = lambda do |node|
      node = node.deep_transform_keys! { |key| key.underscore }
      return nil unless TestOrganization.pluck(:inn).include?(node['inn'])
      {
          inn:       node['inn'],
          full_name: node['full_name'],
          data:      node
      }
    end
    context.nodes_from = ->(xml) { xml['export']['nsiOrganizationList']['nsiOrganization'] }
  end
end
