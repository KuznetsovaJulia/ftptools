class FasUnfairSupplier < ApplicationRecord
    upsert_keys [:registry_num]
end
