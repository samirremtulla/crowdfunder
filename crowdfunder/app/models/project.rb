class Project < ActiveRecord::Base
  belongs_to :user
  has_many :pledges
  attr_accessible :description, :goal, :teaser, :title, :project_id
  
  validates :description, :presence => true
  validates :goal, :presence => true
  validates :teaser, :presence => true
  validates :title, :presence => true
end
