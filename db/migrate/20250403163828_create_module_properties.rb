class CreateModuleProperties < ActiveRecord::Migration[7.2]
  def change
    create_table :module_properties do |t|
      t.references :production_module, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
