class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :posisi
      t.text :keterangan

      t.timestamps null: false
    end
  end
end
