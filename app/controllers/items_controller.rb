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
        if user_signed_in? && params[:user_id]
            @items = current_user.items
        elsif 
            @items = Item.all
        end
    end

    def show
        @item =  Item.find_by_id(params[:id])
    end

    def destroy
        Item.find_by_id(params[:id]).delete
        redirect_to items_path
    end


    private

    def item_params
        params.require(:item).permit(:name, :price, :description, :brand_id, :item_image, brand_attributes: [:name])
    end
end
