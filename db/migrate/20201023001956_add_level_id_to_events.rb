class AddLevelIdToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :level_id, :integer
  end
end
