class TestOrganization < ApplicationRecord
  upsert_keys [:inn]
end
