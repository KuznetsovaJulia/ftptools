class NsiOrganization < ApplicationRecord
  upsert_keys [:inn]
end
