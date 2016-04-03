class CreateJoinTableLocationGroupsLocations < ActiveRecord::Migration[5.0]
  def change
    create_join_table :location_groups, :locations do |t|
      # t.index [:location_group_id, :location_id]
      # t.index [:location_id, :location_group_id]
    end
  end
end
