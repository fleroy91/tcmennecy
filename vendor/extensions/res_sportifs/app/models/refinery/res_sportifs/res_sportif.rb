module Refinery
  module ResSportifs
    class ResSportif < Refinery::Core::BaseModel
      self.table_name = 'refinery_res_sportifs'

      attr_accessible :titre, :description, :position, :date, :photo_id

      belongs_to :photo, :class_name => '::Refinery::Image'

      validates :titre, :presence => true, :uniqueness => true
    end
  end
end
