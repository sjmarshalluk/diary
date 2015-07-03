class ChangePasswordInUsers < ActiveRecord::Migration
  def up
    remove_column :users, :password
  end

  def down
    add_column :users, :password_digest
  end
end
