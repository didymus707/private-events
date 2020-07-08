class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.references :event, null: false, foreign_key: true
      t.references :event_attendee, references: :event_attendances
      t.references :host, references: :users

      t.timestamps
    end
  end
end
