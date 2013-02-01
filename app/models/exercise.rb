class Exercise < ActiveRecord::Base
  attr_accessible :feel, :time

  has_many :activities
end
