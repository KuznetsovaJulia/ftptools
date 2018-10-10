class NsiSingleCustomerReason < ApplicationRecord
  upsert_keys [:single_customer_reason_id]
end
