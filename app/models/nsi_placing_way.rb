class NsiPlacingWay < ApplicationRecord
  upsert_keys [:placing_way_id]

  def serere
    Nsi::PlacingWay::Synchronize
  end
end
