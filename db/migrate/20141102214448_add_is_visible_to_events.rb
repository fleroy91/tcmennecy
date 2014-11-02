class AddIsVisibleToEvents < ActiveRecord::Migration
  def change
    add_column :refinery_events, :a_afficher, :boolean, default: true
  end
end
