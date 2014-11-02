# This migration comes from refinery_sliders (originally 1)
class CreateSlidersSliders < ActiveRecord::Migration

  def up
    create_table :refinery_sliders do |t|
      t.string :titre
      t.string :titre_suite
      t.string :sous_titre
      t.string :lien
      t.integer :photo_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-sliders"})
    end

    drop_table :refinery_sliders

  end

end
