class NsiContractPenaltyReason < ApplicationRecord
  upsert_keys [:code]
end
