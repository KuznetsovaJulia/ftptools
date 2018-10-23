# frozen_string_literal: true

class FcsSynchronize
  # Сервисный объект предназначенный для синхронизации справочника КТРУ
  # Загрузка возможна как с ftp так и с локальной папки
  # возможные параметры load_from: :files, загрузка из файлов, при этом необходимо так же задать массив строк files
  include Interactor::Organizer

  organize DownloadFromFtp, LoadFromFiles


end

=begin
# Команда для синхронизации справочников FAS
[Fcs::Fas::UnfairSupplier.call].map{|catalog| FcsSynchronize.call(catalog)}
# Команда для синхронизации справочников NSI
[Fcs::Nsi::AbandonedReason.call,Fcs::Nsi::CommissionRole.call,Fcs::Nsi::ContractCurrencyCbrf.call,Fcs::Nsi::ContractExecutionDoc.call,Fcs::Nsi::ContractModificationReason.call,Fcs::Nsi::ContractPenaltyReason.call,Fcs::Nsi::ContractSingleCustomerReason.call,Fcs::Nsi::ContractTerminationReason.call,Fcs::Nsi::Kosgu.call,Fcs::Nsi::Ktru.call,Fcs::Nsi::Kvr.call,Fcs::Nsi::Okei.call,Fcs::Nsi::Okopf.call,Fcs::Nsi::Okpd2.call,Fcs::Nsi::Oksm.call,Fcs::Nsi::Oktmo.call,Fcs::Nsi::Okved2.call,Fcs::Nsi::Organization,Fcs::Nsi::OrganizationType,Fcs::Nsi::PlacingWay,Fcs::Nsi::PurchasePlanPositionChangeReason,Fcs::Nsi::PurchasePreference,Fcs::Nsi::PurchaseRejectReason.call,Fcs::Nsi::SpecialPurchase.call,Fcs::Nsi::TenderPlan2017ContractLifeCycleCase.call,Fcs::Nsi::TenderPlan2017PositionChangeReason.call,Fcs::Nsi::TenderPlanPurchaseGroup.call].map{|catalog| FcsSynchronize.call(catalog)}
=end

