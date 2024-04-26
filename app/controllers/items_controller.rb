class ItemsController < ApplicationController
  def index
    if params[:query].present?
      @items = policy_scope(Item).general_search(params[:query]).page params[:page]
    else
      @items = policy_scope(Item).page params[:page]
    end
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
    @reservation = Reservation.new(item:@item)

  end

  def create
    @item = Item.new(items_params)
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
  private

  def set_item
    @item = Item.find(params[:id])
  end

  def items_params
    params.require(:item).permit(:name, :description, :price, :enabled, :subtype_id, images: [])
  end
end
