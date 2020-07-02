class ChangeEventsColumnDescription < ActiveRecord::Migration[6.0]
  def change
    change_column :events, :description, :text
  end
end
