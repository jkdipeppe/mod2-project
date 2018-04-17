class CreateVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :location
      t.integer :capacity
      t.integer :min_age
      t.integer :cost

      t.timestamps
    end
  end
end
