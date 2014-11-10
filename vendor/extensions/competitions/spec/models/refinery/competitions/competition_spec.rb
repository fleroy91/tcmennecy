require 'spec_helper'

module Refinery
  module Competitions
    describe Competition do
      describe "validations" do
        subject do
          FactoryGirl.create(:competition,
          :title => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:title) { should == "Refinery CMS" }
      end
    end
  end
end
