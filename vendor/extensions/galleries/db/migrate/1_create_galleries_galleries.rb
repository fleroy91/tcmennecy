class CreateGalleriesGalleries < ActiveRecord::Migration

  def up
    create_table :refinery_galleries do |t|
      t.string :titre
      t.integer :photo_id
      t.boolean :a_afficher_grand
      t.boolean :a_afficher_petit
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-galleries"})
    end

    drop_table :refinery_galleries

  end

end
