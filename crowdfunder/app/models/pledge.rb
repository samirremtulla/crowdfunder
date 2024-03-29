class Pledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  attr_accessible :amount

  validates :amount, :presence => true
  validates_numericality_of :amount, :only_integer => true, :greater_than => 0
  
  # after_create :send_new_pledge_email


  # def send_new_pledge_email
  #   UserMailer.new_pledge(self).deliver
  # end


end
