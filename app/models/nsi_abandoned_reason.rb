class NsiAbandonedReason < ApplicationRecord
  upsert_keys [:id]
end
