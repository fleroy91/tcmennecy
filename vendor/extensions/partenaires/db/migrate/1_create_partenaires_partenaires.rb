class CreatePartenairesPartenaires < ActiveRecord::Migration

  def up
    create_table :refinery_partenaires do |t|
      t.string :title
      t.text :description
      t.integer :logo_id
      t.string :lien
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-partenaires"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/partenaires/partenaires"})
    end

    drop_table :refinery_partenaires

  end

end
