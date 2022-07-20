class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :user_name, presence: true
  validates :user_profile, presence: true, length: {maximum: 500}, on: :update
  validates_associated :avatar, presence: true, on: :update

  has_one_attached :avatar
  has_many :rooms
  has_many :reservations
end
