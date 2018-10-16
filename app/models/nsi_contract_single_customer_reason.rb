class NsiContractSingleCustomerReason < ApplicationRecord
  upsert_keys [:code]
end
