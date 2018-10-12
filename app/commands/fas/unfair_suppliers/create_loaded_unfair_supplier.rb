# frozen_string_literal: true

class Fas::UnfairSuppliers::CreateLoadedUnfairSupplier
  include Interactor

  def call
    unfair_supplier            = LoadedUnfairSupplier.new
    unfair_supplier.name       = context.file_name
    unfair_supplier.number     = context.number
    unfair_supplier.downloaded = false

    if unfair_supplier.save
      context.unfair_supplier    = unfair_supplier
      context.unfair_supplier_id = unfair_supplier.id
      puts "Файлы из архива #{unfair_supplier.name}"
      Fas::LoadFromFiles.call(context)
    else
      context.fail!
    end
  end
end
