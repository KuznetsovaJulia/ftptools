# frozen_string_literal: true
# Справочник организаций

class Update::Organization
  include Interactor

  def call
    TestOrganization.find_each do |organizaton|
      data = organizaton.data
      organizaton.update(okogu: data['okogu'], district: data['district'],
                         grbs_inn: data['grbs_inn'], oktmoppo: data['oktmoppo'],
                         grbs_code: data['grbs_code'], grbs_type: data['grbs_type'],)
    end

  end
end
