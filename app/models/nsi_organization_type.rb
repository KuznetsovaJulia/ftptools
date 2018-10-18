class NsiOrganizationType < ApplicationRecord
  upsert_keys [:code]
end
