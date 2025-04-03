class Admin::CollaboratorsController < AdminController
  before_action :set_collaborator, only: %i[destroy]
  before_action :set_user, only: %i[show]

  def index
    @collaborators = CollaboratorFinderService.new(current_user).call
  end

  def show
  end

  def new
    @collaborator = Collaborator.new
  end

  def create
    @collaborator = Collaborator.new(collaborator_params)
    @collaborator.admin_id = current_user.id

    if User.exists?(tag: @collaborator.user_tag)
      if @collaborator.save
        redirect_to admin_collaborators_path, notice: "Collaborator created successfully!"
      else
        render :new, status: :unprocessable_entity
      end
    else
      @collaborator.errors.add(:user_tag, "não existe na tabela Users")
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @collaborator.destroy
    redirect_to admin_collaborators_path, notice: "Collaborator deleted successfully!"
  end

  private

  def set_user
    @collaborator = User.find(params[:id])
    @collaborator_tag = Collaborator.find_by(user_tag: @collaborator.tag)
  end

  def set_collaborator
    @collaborator = Collaborator.find(params[:id])
  end

  def collaborator_params
    params.require(:collaborator).permit(:user_tag)
  end
end
