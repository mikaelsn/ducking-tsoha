class Activity < ActiveRecord::Base

  attr_accessible :description, :name, :weight, :sets, :reps, :time

  validates_presence_of :name
  validates :weight, :numericality => true
  validates :sets, :numericality => { :only_integer => true }
  validates :reps, :numericality => { :only_integer => true }

  belongs_to :exercises
  belongs_to :user
end
