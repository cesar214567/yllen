class InventoriesController < ApplicationController
    def new
        @inventory = Inventory.new
    end
    
    def create
        @inventory = Inventory.new(inventory_params)
        if @inventory.save
            @item = Item.find(@inventory.item_id)
            if @inventory.inventory_type == "ingreso"
                @item.update(quantity: @item.quantity + @inventory.quantity)
            else
                @item.update(quantity: @item.quantity - @inventory.quantity)
            end
            redirect_to new_inventory_path, notice: "se agrego el inventario"
        else
            render :new, alert: @invetory.errors.first
        end
    end

    def inventory_params
        params.require(:inventory).permit(:item_id, :inventory_type, :quantity)
    end
end
