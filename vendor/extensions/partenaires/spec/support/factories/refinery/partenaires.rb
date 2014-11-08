
FactoryGirl.define do
  factory :partenaire, :class => Refinery::Partenaires::Partenaire do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

