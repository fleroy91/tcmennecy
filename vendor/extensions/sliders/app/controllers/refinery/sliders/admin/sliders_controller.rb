module Refinery
  module Sliders
    module Admin
      class SlidersController < ::Refinery::AdminController

        crudify :'refinery/sliders/slider',
                :title_attribute => 'titre',
                :xhr_paging => true

      end
    end
  end
end
