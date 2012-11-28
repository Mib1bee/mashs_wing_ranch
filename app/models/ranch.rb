class Ranch < ActiveRecord::Base

  attr_accessible :name, :address_line_1, :address_line_2, :town_city, :postcode, :telephone

  TELEPHONE_REGEX = /^\d+$/

  validates_presence_of :name
  validates_presence_of :address_line_1
  validates_presence_of :town_city
  validates_presence_of :postcode
  validates_presence_of :telephone

  validates_length_of :name, :minimum => 5
  validates_length_of :address_line_1, :minimum => 5
  validates_length_of :town_city, :minimum => 5
  validates_length_of :postcode, :minimum => 5
  validates_length_of :telephone, :minimum => 5

  validates :telephone, :format => TELEPHONE_REGEX

    acts_as_gmappable

def gmaps4rails_address
#describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
  "#{self.address_line_1},#{self.town_city},#{self.postcode}" 
end

def gmaps4rails_infowindow
      "<span class=\"ranch_info\"><b>#{self.name}</b></span></br>#{self.address_line_1},</br>#{self.town_city},</br>#{self.postcode}</br></span><span class=\"info_tel\">#{self.telephone}</span>"
    end

def gmaps4rails_marker_picture
  {
   "picture" => "/assets/locations/bull_marker.png",
   "width" => 50,
   "height" => 50,
  }
end

def gmaps4rails_sidebar
  "<span class=\"ranch_name\">#{self.name}</span></br><span class=\"ranch_address\">#{self.address_line_1},</br>#{self.town_city},</br>#{self.postcode}</br></span><span class=\"ranch_tel\">#{self.telephone}</span></br> <img alt=\"Locations_line\" class=\"listseperator\" src=\"/assets/locations/locations_line.png\">"  #put whatever you want here
end

end
