class CreateResSportifsResSportifs < ActiveRecord::Migration

  def up
    create_table :refinery_res_sportifs do |t|
      t.string :titre
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-res_sportifs"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/res_sportifs/res_sportifs"})
    end

    drop_table :refinery_res_sportifs

  end

end
