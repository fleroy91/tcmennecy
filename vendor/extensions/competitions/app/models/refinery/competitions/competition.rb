module Refinery
  module Competitions
    class Competition < Refinery::Core::BaseModel
      self.table_name = 'refinery_competitions'

      attr_accessible :title, :debut, :fin, :description, :position

      validates :title, :presence => true, :uniqueness => true
    end
  end
end
