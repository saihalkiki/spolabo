class RemoveLevelToEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :level, :integer
  end
end
