class Schedule < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true
  validates :place, presence: true
  validates :start, presence: true
end
