class MailingList < ActiveRecord::Base
  attr_accessible :first_name, :second_name, :company_name, :email

  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z)0-9.-]+\.[A-Z]{2,4}$/i

	validates_presence_of :first_name
	validates_presence_of :second_name

	validates :email, :presence => true, :format => EMAIL_REGEX

end
