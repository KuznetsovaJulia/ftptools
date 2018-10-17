# frozen_string_literal: true




class Context::PlacingWaySet
include Interactor

  def call
    context.dir = 'nsiPlacingWay'
    context.model = NsiPlacingWay
    context.to_value = lambda do |node|
      return nil unless node['subsystemType'] == 'FZ44'

      {
        code: node['code'],
        name: node['name'],
        actual: node['actual'],
        placing_way_type: node['placing_way_type'],
        is_procedure: node['isProcedure'],
        data: node,
        used_in_rpg: node.dig('usedInRPGInfo', 'used_in_rpg'),
        rpg_joint: node.dig('usedInRPGInfo', 'rpg_joint'),
        placing_way_id: node['placingWayId'].to_i
      }
    end

    context.nodes_from = ->(xml) { xml['export']['nsiPlacingWayList']['nsiPlacingWay'] }
  end
end
