class Schedule < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true
  validates :prefecture, presence: true
  validates :start, presence: true
#  validate :days_validation
#
#  def days_validation
#    user = User.find_by(id: user_id)
#    if user.schedules.find_by(start: start)
#      errors.add(:start, "同じ日に予定なしは1つまでです。") 
#    end
#  end
end
