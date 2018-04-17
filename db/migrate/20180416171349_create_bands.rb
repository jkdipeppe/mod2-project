class CreateBands < ActiveRecord::Migration[5.1]
  def change
    create_table :bands do |t|
      t.string :name
      t.string :genre
      t.string :bandmates
      t.string :bio
      t.string :username
      t.string :password_digest
      t.string :picture

      t.timestamps
    end
  end
end
