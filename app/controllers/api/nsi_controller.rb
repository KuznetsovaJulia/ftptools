# frozen_string_literal: true

class Api::NsiController < ApplicationController
  protect_from_forgery with: :null_session

  def get_nsi
    need_catalogs =  params[:catalogs].map{|catalog| catalog.to_sym}
    @nsi   = catalogs.find_all { |k, v| need_catalogs.include?(k) }.to_h
    @nsi.map do |index, item|
      @nsi[index] = item[:model].select([:data, :id] + (item[:columns].nil? ? [] : item[:columns]))
    end
    render :json => @nsi
  end

  def list
    render :json => catalogs.map {|i, k| i }
  end

  private

  def catalogs
    {
        nsi_placing_way:                     { model: NsiPlacingWay },
        nsi_contract_single_customer_reason: { model: NsiContractSingleCustomerReason },
        nsi_special_purchase:                { model: NsiSpecialPurchase },
        nsi_ktru:                            { model: NsiKtru },
        nsi_okei:                            { model: NsiOkei },
        nsi_okpd2:                           { model: NsiOkpd2 }
    }
  end
end
