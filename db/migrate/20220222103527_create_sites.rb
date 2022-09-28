class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.integer :admin_id
      t.string :site_name
      t.string :site_address
      t.string :introduction
      t.string :day
      t.boolean :site_status, null: false, default: ""

      t.timestamps
    end
  end
end
