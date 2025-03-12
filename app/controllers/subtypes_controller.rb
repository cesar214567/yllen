class SubtypesController < ApplicationController
  before_action :authenticate_admin!, only: [:destroy] # Ensure user is an admin before deleting
  before_action :set_type, only: [:show, :destroy]
  def index
    if params[:query].present?
      @subtypes = policy_scope(Subtype).general_search(params[:query]).page params[:page]
    else
      @subtypes = policy_scope(Subtype).page params[:page]
    end
  end

  def new
    @subtype = Subtype.new
    authorize @subtype
  end

  def create
    @subtype = Subtype.new(subtypes_params)
    authorize @subtype
    if @subtype.save
      redirect_to subtypes_path
    else
      render :new
    end
  end

  def show
  end

  def search
    request.format = :json
    subtypes = Subtype.where("name ILIKE ?", "%#{params[:query]}%").limit(5)
    render json: subtypes.map { |subtype| { id: subtype.id, text: subtype.name } }
  end

  def destroy
    if @subtype.destroy
      redirect_to subtypes_path
    else
      render json: { error: "Failed to delete Type" }, status: :unprocessable_entity
    end
  end

  private

  
  def set_type
    @subtype = Subtype.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Subtipo no encontrado" }, status: :not_found
  end
  
  def authenticate_admin!
    unless current_user&.admin?
      render json: { error: "Unauthorized: Admin access required" }, status: :forbidden
    end
  end
  def subtypes_params
    params.require(:subtype).permit(:name, :description, :image, :type_id)
  end
end
