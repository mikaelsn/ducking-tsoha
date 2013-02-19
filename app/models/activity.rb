class Activity < ActiveRecord::Base
  attr_accessible :description, :name, :weight, :sets, :reps

  validates_presence_of :name
  belongs_to :exercise
end
