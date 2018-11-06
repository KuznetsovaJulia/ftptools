class Organization < ApplicationRecord
  upsert_keys [:inn]
end
