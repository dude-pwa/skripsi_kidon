class CreateBobots < ActiveRecord::Migration
  def change
    create_table :bobots do |t|
      t.integer :w1
      t.integer :w2
      t.integer :w3
      t.integer :w4
      t.integer :w5

      t.timestamps null: false
    end
  end
end
