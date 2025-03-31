class Property < ApplicationRecord
  validates :name, :address, :size, presence: true
  validates :address, presence: true
  validates :size, presence: true
  belongs_to :user
end
