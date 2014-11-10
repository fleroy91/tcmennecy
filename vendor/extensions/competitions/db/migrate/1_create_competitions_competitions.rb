class CreateCompetitionsCompetitions < ActiveRecord::Migration

  def up
    create_table :refinery_competitions do |t|
      t.string :title
      t.date :debut
      t.date :fin
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-competitions"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/competitions/competitions"})
    end

    drop_table :refinery_competitions

  end

end
