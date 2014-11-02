# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Sliders" do
    describe "Admin" do
      describe "sliders" do
        refinery_login_with :refinery_user

        describe "sliders list" do
          before do
            FactoryGirl.create(:slider, :titre => "UniqueTitleOne")
            FactoryGirl.create(:slider, :titre => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.sliders_admin_sliders_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.sliders_admin_sliders_path

            click_link "Add New Slider"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Titre", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Sliders::Slider.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Titre can't be blank")
              Refinery::Sliders::Slider.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:slider, :titre => "UniqueTitle") }

            it "should fail" do
              visit refinery.sliders_admin_sliders_path

              click_link "Add New Slider"

              fill_in "Titre", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Sliders::Slider.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:slider, :titre => "A titre") }

          it "should succeed" do
            visit refinery.sliders_admin_sliders_path

            within ".actions" do
              click_link "Edit this slider"
            end

            fill_in "Titre", :with => "A different titre"
            click_button "Save"

            page.should have_content("'A different titre' was successfully updated.")
            page.should have_no_content("A titre")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:slider, :titre => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.sliders_admin_sliders_path

            click_link "Remove this slider forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Sliders::Slider.count.should == 0
          end
        end

      end
    end
  end
end
