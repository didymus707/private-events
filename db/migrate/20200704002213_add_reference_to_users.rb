class AddReferenceToUsers < ActiveRecord::Migration[6.0]
  def change 
    add_reference :users, :anchor, foreign_key: {to_table: :users}
  end
end

# add_reference(:products, :supplier, foreign_key: {to_table: :firms})