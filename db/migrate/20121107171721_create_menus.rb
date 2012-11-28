class CreateMenus < ActiveRecord::Migration
  
  def up
    create_table :menus do |t|
    	t.string "category", :limit => 100
    	t.boolean "core", :default => true
    	t.string "item", :limit => 255
    	t.text "description"
      t.timestamps
    end
    add_index("menus", "category")
    add_index("menus", "item")
  end

  def down
  	  drop_table :menus
  end
end
