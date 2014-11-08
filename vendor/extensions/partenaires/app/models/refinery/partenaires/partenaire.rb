module Refinery
  module Partenaires
    class Partenaire < Refinery::Core::BaseModel
      self.table_name = 'refinery_partenaires'

      attr_accessible :title, :description, :logo_id, :lien, :position

      validates :title, :presence => true, :uniqueness => true

      belongs_to :logo, :class_name => '::Refinery::Image'
    end
  end
end
