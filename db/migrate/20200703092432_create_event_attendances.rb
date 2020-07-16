class CreateEventAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :event_attendances do |t|
      t.references :attended_event, references: :event, foreign_key: { to_table: :events }
      t.references :event_attendee, references: :users, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
