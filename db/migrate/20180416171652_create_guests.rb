class CreateGuests < ActiveRecord::Migration[5.1]
  def change
    create_table :guests do |t|
      t.string :username
      t.string :password
      t.string :name
      t.integer :age
      t.string :location

      t.timestamps
    end
  end
end
