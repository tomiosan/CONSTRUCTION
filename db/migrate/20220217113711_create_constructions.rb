class CreateConstructions < ActiveRecord::Migration[5.2]
  def change
    create_table :constructions do |t|
      t.integer :admin_id
      t.string :construction_name
      t.string :site
      t.integer :introduction
      t.string :day
      t.boolean :construction_status, null: false, default: ""


      t.timestamps
    end
  end
end
