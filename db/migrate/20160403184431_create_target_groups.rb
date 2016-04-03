class CreateTargetGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :target_groups do |t|
      t.references :panel_provider
      t.string :name
      t.string :external_id
      t.integer :parent_id
      t.string :secret_code

      t.timestamps
    end
  end
end
