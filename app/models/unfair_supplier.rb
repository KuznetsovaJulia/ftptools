class UnfairSupplier < ApplicationRecord
    upsert_keys [:inn,:registry_num]
end
