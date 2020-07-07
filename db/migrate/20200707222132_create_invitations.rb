class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.references :event, null: false, foreign_key: true
      t.references :guest, references: :users, foreign_key: { to_table: :users }
      t.references :anchor, references: :users, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
