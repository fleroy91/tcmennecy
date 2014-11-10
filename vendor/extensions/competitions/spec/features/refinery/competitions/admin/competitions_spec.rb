# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Competitions" do
    describe "Admin" do
      describe "competitions" do
        refinery_login_with :refinery_user

        describe "competitions list" do
          before do
            FactoryGirl.create(:competition, :title => "UniqueTitleOne")
            FactoryGirl.create(:competition, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.competitions_admin_competitions_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.competitions_admin_competitions_path

            click_link "Add New Competition"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Competitions::Competition.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Competitions::Competition.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:competition, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.competitions_admin_competitions_path

              click_link "Add New Competition"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Competitions::Competition.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:competition, :title => "A title") }

          it "should succeed" do
            visit refinery.competitions_admin_competitions_path

            within ".actions" do
              click_link "Edit this competition"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:competition, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.competitions_admin_competitions_path

            click_link "Remove this competition forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Competitions::Competition.count.should == 0
          end
        end

      end
    end
  end
end
