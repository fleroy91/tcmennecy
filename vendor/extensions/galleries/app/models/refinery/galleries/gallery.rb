module Refinery
  module Galleries
    class Gallery < Refinery::Core::BaseModel
      self.table_name = 'refinery_galleries'

      attr_accessible :titre, :photo_id, :a_afficher_grand, :a_afficher_petit, :position

      validates :titre, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'
    end
  end
end
