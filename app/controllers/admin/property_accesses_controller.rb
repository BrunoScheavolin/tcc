class Admin::PropertyAccessesController < AdminController
  before_action :set_property_access, only: [:destroy]

  def new
    @collaborators = CollaboratorFinderService.new(current_user).call
    @property_access = PropertyAccess.new
    @property = Property.find(params[:id])
  end

  def create
    @property_access = PropertyAccess.new(property_access_params)

    if @property_access.save
      redirect_to admin_property_path(@property_access.property), notice: "Usuário adicionado com sucesso!"
    else
      flash[:alert] = "Erro ao adicionar usuário."
      redirect_back fallback_location: admin_properties_path
    end
  end

  def destroy
    property = @property_access.property
    @property_access.destroy

    redirect_to admin_property_path(property), notice: "Colaborador removido com sucesso."
  end

  private

  def set_property_access
    @property_access = PropertyAccess.find(params[:id])
  end

  def property_access_params
    params.require(:property_access).permit(:property_id, :user_id)
  end
end
