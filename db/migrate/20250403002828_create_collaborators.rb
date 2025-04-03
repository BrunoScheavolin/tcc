class CreateCollaborators < ActiveRecord::Migration[7.2]
  def change
    create_table :collaborators do |t|
      t.references :admin, null: false, foreign_key: { to_table: :users }
      t.string :user_tag, null: false

      t.timestamps
    end

    add_index :collaborators, [:admin_id, :user_tag], unique: true
  end
end
