class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :role, presence: true
  validates :email, presence: true
  enum role: %i[client admin]
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  has_many :properties
end
