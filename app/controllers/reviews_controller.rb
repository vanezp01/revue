class ReviewsController < ApplicationController
  before_action :find_flick

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.flick_id = @flick.id
    @review.user_id = current_user.id

    if @review.save
      redirect_to flick_path(@flick)
    else
      render 'new'
    end
  end

  private
    def review_params
      params.require(:review).permit(:rating, :comment)
    end

    def find_flick
      @flick = Flick.find(params[:flick_id])
    end
  end

end
