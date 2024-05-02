class SubtypesController < ApplicationController
  before_action :set_subtype, only: [:show]
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
  private

  def set_subtype
    @subtype = Subtype.find(params[:id])
  end

  def subtypes_params
    params.require(:subtype).permit(:name, :description, :image, :type_id)
  end
end
