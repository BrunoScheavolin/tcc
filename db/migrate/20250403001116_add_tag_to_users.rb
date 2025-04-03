class AddTagToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :tag, :string
    add_index :users, :tag, unique: true
  end
end