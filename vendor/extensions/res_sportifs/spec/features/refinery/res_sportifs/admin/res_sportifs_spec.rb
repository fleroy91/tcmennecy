# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "ResSportifs" do
    describe "Admin" do
      describe "res_sportifs" do
        refinery_login_with :refinery_user

        describe "res_sportifs list" do
          before do
            FactoryGirl.create(:res_sportif, :titre => "UniqueTitleOne")
            FactoryGirl.create(:res_sportif, :titre => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.res_sportifs_admin_res_sportifs_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.res_sportifs_admin_res_sportifs_path

            click_link "Add New Res Sportif"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Titre", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::ResSportifs::ResSportif.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Titre can't be blank")
              Refinery::ResSportifs::ResSportif.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:res_sportif, :titre => "UniqueTitle") }

            it "should fail" do
              visit refinery.res_sportifs_admin_res_sportifs_path

              click_link "Add New Res Sportif"

              fill_in "Titre", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::ResSportifs::ResSportif.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:res_sportif, :titre => "A titre") }

          it "should succeed" do
            visit refinery.res_sportifs_admin_res_sportifs_path

            within ".actions" do
              click_link "Edit this res sportif"
            end

            fill_in "Titre", :with => "A different titre"
            click_button "Save"

            page.should have_content("'A different titre' was successfully updated.")
            page.should have_no_content("A titre")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:res_sportif, :titre => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.res_sportifs_admin_res_sportifs_path

            click_link "Remove this res sportif forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::ResSportifs::ResSportif.count.should == 0
          end
        end

      end
    end
  end
end
