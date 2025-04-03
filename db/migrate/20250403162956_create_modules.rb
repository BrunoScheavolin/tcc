class CreateModules < ActiveRecord::Migration[7.2]
  def change
    create_table :production_modules do |t|
      t.string :name, null: false
      t.boolean :active, default: false, null: false
      t.json :settings, default: {}
      t.integer :module_type, null: false, default: 0

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
