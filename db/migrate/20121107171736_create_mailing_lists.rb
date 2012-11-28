class CreateMailingLists < ActiveRecord::Migration
  
  def up
    create_table :mailing_lists do |t|
    	t.string "first_name", :limit => 50
    	t.string "second_name", :limit => 50
    	t.string "email", :limit => 100
    	t.string "company_name", :limit => 100, :null=> true
      t.timestamps
    end
  end

  def down
  	drop_table :mailing_lists
  end

end
