# frozen_string_literal: true
# Справочник оснований признания процедуры несостоявшейся
class Fcs::Nsi::RegulationruleTatarstanResp
  include Interactor

  def call
    context.dir        = 'regulationrules'
    context.path       = '/fcs_regions/Tatarstan_Resp/'
    context.model      = RegionsRegulationruleTatarstanResp
    context.to_value   = lambda do |node|

      {
          id:   node['id'].to_i,
          doc_publish_date: node['docPublishDate'],
          registry_num: node['registryNum'],
          data: node
      }
    end
    context.nodes_from = ->(xml) { xml['export']['fcsRegulationRules%'] }
  end
end
