module Refinery
  module Competitions
    module Admin
      class CompetitionsController < ::Refinery::AdminController

        crudify :'refinery/competitions/competition',
                :xhr_paging => true

      end
    end
  end
end
