class NsiContractModificationReason < ApplicationRecord
  upsert_keys [:code]
end
