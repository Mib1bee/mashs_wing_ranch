class CreateFranchises < ActiveRecord::Migration
  
  def change
    create_table :franchises do |t|

    	t.string "title", :limit => 15
    	t.string "first_name", :limit => 50
    	t.string "second_name", :limit => 50

    	t.string "address_line_1", :limit => 100
    	t.string "address_line_2", :limit => 100
    	t.string "town_city", :limit => 100
    	t.string "postcode", :limit => 10
    	t.string "country", :limit => 100

      t.string "email", :limit => 100
    	t.string "telephone", :limit => 25

    	t.string "investment", :limit => 255
    	t.string "location_country", :limit => 255
      t.string "location_town_city", :limit => 255

    	t.string "timeframe", :limit => 100, :null=> true
    	t.string "preferred_contact", :default => "Telephone", :null=> true
    	t.string "preferred_contact_time", :limit => 50, :null=> true
    	t.string "alternative_telephone", :limit => 25, :null=> true

    	t.text "extra", :null=> true

      t.timestamps
    end
  end

  def down
  	drop_table :franchises
  end

end
