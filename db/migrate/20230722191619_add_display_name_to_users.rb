class AddDisplayNameToUsers < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :display_name, :string
  end
  def down
    remove_column :users, :display_name, :string
  end
end
