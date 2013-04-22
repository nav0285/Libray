class Subject < ActiveRecord::Base
  
  has_many :books, :dependent=> :destroy

  attr_accessible :name
  
  validates_presence_of :name

  validates_uniqueness_of :name

  validates_length_of :name, :in=>3..10

end
