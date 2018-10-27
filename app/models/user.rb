class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:line]
         
  has_many :schedules
  has_many :user_groups
  has_many :groups, through: :user_groups
end
