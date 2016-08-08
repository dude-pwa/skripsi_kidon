class CreateCriteria < ActiveRecord::Migration
  def change
    create_table :criteria do |t|
      t.float :tinggi_badan
      t.float :berat_badan
      t.float :kecepatan_berlari
      t.string :akurasi_tendangan
      t.float :prestasi
      t.references :member, index: true, foreign_key: true
      t.references :group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
