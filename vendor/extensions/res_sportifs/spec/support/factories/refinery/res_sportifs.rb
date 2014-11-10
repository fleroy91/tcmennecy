
FactoryGirl.define do
  factory :res_sportif, :class => Refinery::ResSportifs::ResSportif do
    sequence(:titre) { |n| "refinery#{n}" }
  end
end

