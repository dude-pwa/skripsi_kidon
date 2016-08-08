class AddFieldToMembers < ActiveRecord::Migration
  def change
    add_column :members, :tanggal_lahir, :date
    add_column :members, :handphone, :string
  end
end
