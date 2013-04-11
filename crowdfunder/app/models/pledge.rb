class Pledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  attr_accessible :amount, :project_id, :user_id

  validates :amount, :presence => true
  validates_numericality_of :amount, :only_integer => true, :greater_than => 0
 
end
