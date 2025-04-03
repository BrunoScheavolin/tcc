class User < ApplicationRecord
  validates :role, presence: true
  validates :email, presence: true
  enum role: %i[collaborator admin]
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :properties
  has_many :property_accesses
  has_many :production_modules
  before_create :generate_unique_tag

  private

  def generate_unique_tag
    loop do
      self.tag = "#{name.parameterize(separator: " ")}##{rand(1000..9999)}"
      break unless User.exists?(tag: tag)
    end
  end
end
