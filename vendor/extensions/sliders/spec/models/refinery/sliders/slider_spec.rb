require 'spec_helper'

module Refinery
  module Sliders
    describe Slider do
      describe "validations" do
        subject do
          FactoryGirl.create(:slider,
          :titre => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:titre) { should == "Refinery CMS" }
      end
    end
  end
end
