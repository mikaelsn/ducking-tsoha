class Exercise < ActiveRecord::Base
  attr_accessible :feel, :time, :color

  validates_presence_of :feel, :time
  
  has_many :activities

  belongs_to :user
end
