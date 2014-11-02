module Refinery
  module Sliders
    class Slider < Refinery::Core::BaseModel
      self.table_name = 'refinery_sliders'

      attr_accessible :titre, :titre_suite, :sous_titre, :lien, :photo_id, :position

      validates :titre, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'
    end
  end
end
