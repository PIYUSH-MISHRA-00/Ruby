class CreatePatients < ActiveRecord::Migration[7.2]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.text :address
      t.string :phone
      t.date :registered_on

      t.timestamps
    end
  end
end
