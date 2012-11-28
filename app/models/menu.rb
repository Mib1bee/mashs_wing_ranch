class Menu < ActiveRecord::Base


  attr_accessible :category, :core, :item, :description

  CATEGORY_TYPES = ['Chicken','Burgers','Hot Dogs','Grilled Subs','Wraps & Salads','Sizzlers','Sides']

  scope :chicken, where(:category => "Chicken")
  scope :burgers, where(:category => "Burgers")
  scope :hotdogs, where(:category => "Hot Dogs")
  scope :gsubs, where(:category => "Grilled Subs")
  scope :wraps, where(:category => "Wraps & Salads")
  scope :sizzlers, where(:category => "Sizzlers")
  scope :sides, where(:category => "Sides")

  validates_presence_of :item
  validates_presence_of :description

  validates_length_of :item, :minimum => 5
  validates_length_of :description, :minimum => 25

  validates_inclusion_of :category, :in => CATEGORY_TYPES, :message => "must be one of: #{CATEGORY_TYPES.join(' ')}"

end
