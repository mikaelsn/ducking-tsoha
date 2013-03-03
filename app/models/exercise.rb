class Exercise < ActiveRecord::Base
  attr_accessible :feel, :time

  validates_presence_of :feel, :time
  
  has_many :activities, dependent: :destroy

  belongs_to :user
end
