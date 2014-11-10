class AddDateToRefineryResSportifs < ActiveRecord::Migration
  def change
    add_column :refinery_res_sportifs, :date, :date
    add_column :refinery_res_sportifs, :photo_id, :integer
  end
end
