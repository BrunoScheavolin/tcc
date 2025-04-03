class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :role, presence: true
  validates :email, presence: true
  enum role: %i[client admin]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :properties

  before_create :generate_unique_tag

  private

  def generate_unique_tag
    loop do
      self.tag = "#{name.parameterize(separator: ' ')}##{rand(1000..9999)}"
      break unless User.exists?(tag: tag)
    end
  end
end
