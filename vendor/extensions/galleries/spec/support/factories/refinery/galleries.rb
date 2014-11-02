
FactoryGirl.define do
  factory :gallery, :class => Refinery::Galleries::Gallery do
    sequence(:titre) { |n| "refinery#{n}" }
  end
end

