class ChangePrestasiColumn < ActiveRecord::Migration
  def change
  	rename_column :criteria, :prestasi, :mental_bertanding
  end
end
