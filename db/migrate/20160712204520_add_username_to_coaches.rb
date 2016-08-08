class AddUsernameToCoaches < ActiveRecord::Migration
  def change
    add_column :coaches, :username, :string
  end
end
