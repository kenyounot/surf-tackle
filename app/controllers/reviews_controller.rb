class ReviewsController < ApplicationController
    def new
        @item = Item.find_by_id(params[:item_id])
        @review = @item.reviews.build
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
    end

    private

    def review_params
        params.require(:review).permit(:item_id, :content, :stars, :title)
    end
end
