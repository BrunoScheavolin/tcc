class CreateAdminCollaborators < ActiveRecord::Migration[7.2]
  def change
    create_table :admin_collaborators do |t|
      t.references :admin, null: false, foreign_key: { to_table: :users }
      t.references :user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :admin_collaborators, [:admin_id, :user_id], unique: true
  end
end