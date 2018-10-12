# frozen_string_literal: true

class Api::NsiController < ApplicationController
  protect_from_forgery with: :null_session

  def get_nsi

    @nsi = {}

    vocs.each do |index, item|
      @nsi[index] = item.constantize.select( :data, :id )
    end
    render :json => @nsi
  end
  
  def vocs
    {
        nsi_placing_way: 'NsiPlacingWay',
        nsi_single_customer_reason: 'NsiSingleCustomerReason',
        nsi_special_purchase: 'NsiSpecialPurchase'

    }

  end
  
  
  
end
