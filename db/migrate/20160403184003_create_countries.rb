class CreateCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :countries do |t|
      t.references :panel_provider
      t.string :country_code

      t.timestamps
    end
  end
end
