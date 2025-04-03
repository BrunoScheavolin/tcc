class Property < ApplicationRecord
  validates :name, :address, :size, presence: true
  validates :address, presence: true
  validates :size, presence: true
  belongs_to :user
  has_many :property_accesses
  has_many :collaborators, through: :property_accesses, source: :user
  has_many :module_properties
  has_many :production_modules, through: :module_properties
end
