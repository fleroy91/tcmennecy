# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Partenaires" do
    describe "Admin" do
      describe "partenaires" do
        refinery_login_with :refinery_user

        describe "partenaires list" do
          before do
            FactoryGirl.create(:partenaire, :title => "UniqueTitleOne")
            FactoryGirl.create(:partenaire, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.partenaires_admin_partenaires_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.partenaires_admin_partenaires_path

            click_link "Add New Partenaire"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Partenaires::Partenaire.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Partenaires::Partenaire.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:partenaire, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.partenaires_admin_partenaires_path

              click_link "Add New Partenaire"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Partenaires::Partenaire.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:partenaire, :title => "A title") }

          it "should succeed" do
            visit refinery.partenaires_admin_partenaires_path

            within ".actions" do
              click_link "Edit this partenaire"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:partenaire, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.partenaires_admin_partenaires_path

            click_link "Remove this partenaire forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Partenaires::Partenaire.count.should == 0
          end
        end

      end
    end
  end
end
