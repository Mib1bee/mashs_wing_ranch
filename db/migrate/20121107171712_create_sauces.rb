class CreateSauces < ActiveRecord::Migration
  
  def up
    create_table :sauces do |t|
    	t.string "name", :limit => 50
    	t.text "description", :limit => 1000
    	t.integer "heat_level", :limit => 1
    	t.string "pic_url", :limit => 255
    	t.string "title_colour", :limit => 10
    	t.string "description_colour", :limit => 10
      t.timestamps
    end
    add_index("sauces", "name")
  end

  def down
  	  	drop_table :sauces
  end

end
