class AlterRanches < ActiveRecord::Migration

  def up
  	add_column("ranches", "longitude", "string") 
  	add_column("ranches", "latitude", "string") 
  	add_column("ranches", "gmaps", "boolean", :default => false) 
  end

  def down
  	remove_column("ranches","longitude")
  	remove_column("ranches","latitude")
  	remove_column("ranches","gmaps")
  end

end
