class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :location
      t.datetime :date
      t.references :host, references: :users, foreign_key: { to_table: :users }

      t.timestamps
    end
    
  end
end