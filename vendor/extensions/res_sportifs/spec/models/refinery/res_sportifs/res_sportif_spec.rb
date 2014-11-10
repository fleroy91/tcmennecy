require 'spec_helper'

module Refinery
  module ResSportifs
    describe ResSportif do
      describe "validations" do
        subject do
          FactoryGirl.create(:res_sportif,
          :titre => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:titre) { should == "Refinery CMS" }
      end
    end
  end
end
