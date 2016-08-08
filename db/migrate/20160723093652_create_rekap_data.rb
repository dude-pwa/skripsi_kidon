class CreateRekapData < ActiveRecord::Migration
  def change
    create_table :rekap_data do |t|
      t.string :nama
      t.date :tanggal_lahir
      t.text :alamat
      t.string :handphone
      t.string :posisi
      t.float :nilai
      t.integer :ranking

      t.timestamps null: false
    end
  end
end
