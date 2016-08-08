class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :nama
      t.text :alamat

      t.timestamps null: false
    end
  end
end
