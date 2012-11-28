
class Franchise < ActiveRecord::Base
  
  attr_accessible :title, :first_name, :second_name, :address_line_1, :address_line_2, :town_city, :postcode, :country, :email, :telephone, :investment, :location_country, :location_town_city, :timeframe, :preferred_contact, :preferred_contact_time, :alternative_telephone, :extra

	EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z)0-9.-]+\.[A-Z]{2,4}$/i

	validates_presence_of :title
	validates_presence_of :first_name
	validates_presence_of :second_name
	validates_presence_of :address_line_1
	validates_presence_of :town_city
	validates_presence_of :postcode
	validates_presence_of :country
	validates_presence_of :telephone
	validates_presence_of :investment
	validates_presence_of :location_country
	validates_presence_of :location_town_city
	validates_presence_of :timeframe
	validates_presence_of :preferred_contact
	validates_presence_of :preferred_contact_time

	validates :email, :presence => true, :format => EMAIL_REGEX

end
