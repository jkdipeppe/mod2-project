class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.integer :show_id
      t.integer :guest_id
      t.string :ticket_type
      t.integer :price

      t.timestamps
    end
  end
end
