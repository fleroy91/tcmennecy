
FactoryGirl.define do
  factory :slider, :class => Refinery::Sliders::Slider do
    sequence(:titre) { |n| "refinery#{n}" }
  end
end

