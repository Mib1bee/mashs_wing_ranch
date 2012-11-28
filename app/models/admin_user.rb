require 'digest/sha1'

class AdminUser < ActiveRecord::Base

  
  # because we created a migration to change the name of the users tabe to admin_users we have to specify
  # set_table_name("admin_users")
  # or we can change the class name and file name like we did
  attr_accessible :first_name, :last_name, :username, :email, :password 
  attr_accessor :password
  attr_protected :hashed_password, :salt

  scope :named, lambda {|first,last| where(:first_name => first, :last_name => last)}

  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z)0-9.-]+\.[A-Z]{2,4}$/i

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :username

  validates_length_of :first_name, :maximum => 25
  validates_length_of :last_name, :maximum => 50
  validates_length_of :username, :within => 3..25

  validates_length_of :password, :within => 8..25, :on => :create

  validates_uniqueness_of :username

  validates :email, :presence => true, :length => {:maximum => 100}, :format => EMAIL_REGEX, :confirmation => true

  before_save :create_hashed_password
  after_save :clear_password

  scope :sorted, order("admin_users.last_name ASC, admin_users.first_name ASC")

  def name
    "#{first_name} #{last_name}"
  end

  def self.authenticate(username="", password="")
    user = AdminUser.find_by_username(username)
    if user && user.password_match?(password)
      return user
    else
      return false
    end
  end

  def password_match?(password="")
    hashed_password == AdminUser.hash_with_salt(password,salt) 
  end

  def self.make_salt(username="")
    Digest::SHA1.hexdigest("User #{username} with #{Time.now} to make salt")
  end

  def self.hash_with_salt(password="", salt="")
    Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
  end

  private

  def create_hashed_password
    unless password.blank?
      self.salt = AdminUser.make_salt(username) if salt.blank?
      self.hashed_password = AdminUser.hash_with_salt(password,salt)
    end
  end

  def clear_password
    self.password = nil
  end

end