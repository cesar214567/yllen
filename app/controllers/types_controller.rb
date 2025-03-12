class TypesController < ApplicationController
  before_action :authenticate_admin!, only: [:destroy] # Ensure user is an admin before deleting
  before_action :set_type, only: [:show, :destroy]

  def index
    if params[:query].present?
      @types = policy_scope(Type).general_search(params[:query]).page params[:page]
    else
      @types = policy_scope(Type).page params[:page]
    end
  end

  def new
    @type = Type.new
    authorize @type
  end

  def show
  end

  def create
    @type = Type.new(types_params)
    authorize @type
    if @type.save
      redirect_to types_path
    else
      render :new
    end
  end

  def destroy
    if @type.destroy
      redirect_to types_path
    else
      render json: { error: "Failed to delete Type" }, status: :unprocessable_entity
    end
  end

  def search
    request.format = :json
    types = Type.where("name ILIKE ?", "%#{params[:query]}%").limit(5)
    render json: types.map { |type| { id: type.id, text: type.name } }
  end

  private

  def set_type
    @type = Type.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Type not found" }, status: :not_found
  end


  def types_params
    params.require(:type).permit(:name, :description, :image)
  end
  
  def authenticate_admin!
    unless current_user&.admin?
      render json: { error: "Unauthorized: Admin access required" }, status: :forbidden
    end
  end
end
