module Refinery
  module Partenaires
    module Admin
      class PartenairesController < ::Refinery::AdminController

        crudify :'refinery/partenaires/partenaire',
                :xhr_paging => true

      end
    end
  end
end
