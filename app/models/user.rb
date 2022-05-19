class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one  :account
  has_many :gears, dependent: :destroy
  has_many :bookings
  has_many :bookings_as_owner, through: :gears, source: :bookings
  has_many :assignments
  has_many :roles, through: :assignments
end
