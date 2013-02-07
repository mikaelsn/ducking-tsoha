class Exercise < ActiveRecord::Base
  attr_accessible :feel, :time

  validates_presence_of :feel
  
  has_many :activities

  belongs_to :user
end
