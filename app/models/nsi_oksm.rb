class NsiOksm < ApplicationRecord
  upsert_keys [:country_code]
end
