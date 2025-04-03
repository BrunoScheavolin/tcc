class CollaboratorFinderService
  def initialize(admin)
    @admin = admin
  end

  def call
    tags = Collaborator.where(admin_id: @admin.id).pluck(:user_tag)
    User.where(tag: tags)
  end
end
