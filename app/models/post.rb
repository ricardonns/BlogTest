class Post < ActiveRecord::Base

  #White list
  #attr_accessible :name

  belongs_to :category

  has_many :comments

  validates_presence_of :name, :category

  validates :title, :presence => true, :length => {:minimum => 5} 
  validates :name, :presence => true

end
