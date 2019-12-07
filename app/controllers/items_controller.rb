class ItemsController < ApplicationController
    def new
        @item = Item.new
        @item.build_brand
    end

    def create
         
        @item = Item.new(item_params)
        @item.user_id = current_user.id 
        if @item.save
            redirect_to item_path(@item)
        else
            render :new
        end
    end

    def index
        if params[:user_id]
            @items = current_user.items
        else
            @items = Item.all
        end
        
    end

    def show
        @item =  Item.find_by_id(params[:id])
    end


    private

    def item_params
        params.require(:item).permit(:name, :price, :description, :brand_id, brand_attributes: [:name])
    end
end
