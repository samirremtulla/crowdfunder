class Pledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  attr_accessible :amount

  validates :amount, :presence => true
  validates_numericality_of :amount, :only_integer => true
 
end
