class NsiContractCurrencyCbrf < ApplicationRecord
  upsert_keys [:code]
end
