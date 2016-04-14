class CreateDrawResults < ActiveRecord::Migration[5.0]
  def change
    create_table :draw_results do |t|
      t.references :draw, foreign_key: true
      t.integer :value

      t.timestamps
    end
  end
end
