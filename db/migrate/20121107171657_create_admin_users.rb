class CreateAdminUsers < ActiveRecord::Migration
  
  def up
    create_table :admin_users do |t|
      t.string "first_name", :limit => 25
      t.string "last_name", :limit => 50
      t.string "email", :limit => 100
      t.string "username", :limit => 25
      t.string "salt", :limit => 40
      t.string "hashed_password", :limit => 40
      t.timestamps
    end
    add_index("admin_users", "username")
  end

  def down
  	drop_table :admin_users
  end

end
