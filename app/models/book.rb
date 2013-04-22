class Book < ActiveRecord::Base

  belongs_to :subject

  attr_accessible :title, :description, :subject_id

  validates_presence_of :title,:description

  validates_uniqueness_of :title

  validates_length_of :title, :in=>3..20

  validates_length_of :description, :minimum=>5

end
