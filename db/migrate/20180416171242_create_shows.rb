class CreateShows < ActiveRecord::Migration[5.1]
  def change
    create_table :shows do |t|
      t.integer :venue_id
      t.integer :band_id
      t.string :name
      t.datetime :date

      t.timestamps
    end
  end
end
