class NsiKvr < ApplicationRecord
  upsert_keys [:code]
end
