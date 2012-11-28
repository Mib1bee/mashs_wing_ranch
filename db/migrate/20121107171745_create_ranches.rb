class CreateRanches < ActiveRecord::Migration
  
  def up
    create_table :ranches do |t|
    	t.string "name", :limit => 100
    	t.string "address_line_1", :limit => 100
    	t.string "address_line_2", :limit => 100
    	t.string "town_city", :limit => 100
    	t.string "postcode", :limit => 10
    	t.string "telephone", :limit => 25
      t.timestamps
    end
    add_index("ranches", "name")
    add_index("ranches", "postcode")
  end

  def down
  	drop_table :ranches
  end

end
