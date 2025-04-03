class Collaborator < ApplicationRecord
  validates :admin_id, :user_tag, presence: true
end
