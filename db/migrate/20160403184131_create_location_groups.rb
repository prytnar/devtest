class CreateLocationGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :location_groups do |t|
      t.references :panel_provider
      t.references :country
      t.string :name

      t.timestamps
    end
  end
end
