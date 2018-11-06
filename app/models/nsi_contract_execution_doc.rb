class NsiContractExecutionDoc < ApplicationRecord
  upsert_keys [:code]
end
