class ReviewsController < ApplicationController
    before_action :authenticate_user!, only: [:new]

    def new
        if params[:item_id]
            @item = Item.find_by_id(params[:item_id])
            @review = @item.reviews.build
        else
            @review = Review.new
        end
    end

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    def show
        @review = Review.find_by_id(params[:id])
    end

    def index
        if params[:item_id]
            @reviews = Item.find_by_id(params[:item_id]).reviews
            @item = Item.find_by_id(params[:item_id])
        else
            redirect_to items_path
        end
    end

    private

    def review_params
        params.require(:review).permit(:item_id, :content, :stars, :title)
    end
end
