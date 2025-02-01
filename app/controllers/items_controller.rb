class ItemsController < ApplicationController
  def index
    @items = policy_scope(Item)
    if params[:query].present?
      @items = @items.general_search(params[:query])
    end
    unless current_user.admin?
      @items = @items.where(enabled: true)
    end
    @items = @items.page(params[:page])
    authorize @items
  end

  def new
    @item = Item.new
    authorize @item
  end

  def show
    @item = Item.find(params[:id])
    @reservation = Reservation.new(item:@item)
  end

  def create
    puts "asdasdasdassdasd"
    @item = Item.new(items_params)
    @item.subtype = Subtype.find(@item.subtype_id)
    @item.quantity = 0 
    authorize @item
    if @item.save
      redirect_to item_path(@item)
    else
      render :new
    end
  end


  def update
    @item = Item.find(params[:id])
    @item.update(items_params)
    redirect_to items_path
  end
  
  def search
    request.format = :json
    items = Item.where("name ILIKE ?", "%#{params[:query]}%").limit(5)
    render json: items.map { |item| { id: item.id, text: item.name } }
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def items_params
    params.require(:item).permit(:name, :description, :price, :enabled, :subtype_id, images: [])
  end
end
