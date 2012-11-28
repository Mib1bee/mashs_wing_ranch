class Sauce < ActiveRecord::Base

  attr_accessible :name, :description, :heat_level, :pic_url, :title_colour, :description_colour

  COLOUR_HASH_REGEX = /^\#(\d|[a-z]){6}$/i

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :heat_level
  validates_presence_of :pic_url

  validates_length_of :name, :maximum => 50
  validates_length_of :description, :minimum => 50, :maximum => 255

  validates :title_colour, :presence => true, :length => {:is => 7}, :format => COLOUR_HASH_REGEX
  validates :description_colour, :presence => true, :length => {:is => 7}, :format => COLOUR_HASH_REGEX  


end
