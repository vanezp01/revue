class ReviewsController < ApplicationController
  before_action :find_flick
  before_action :find_review, only: [:edit, :update, :destroy]

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

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to flick_path(@flick)
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    redirect_to flick_path(@flick)
  end 

  private
    def review_params
      params.require(:review).permit(:rating, :comment)
    end

    def find_flick
      @flick = Flick.find(params[:flick_id])
    end

    def find_review
      @review = Review.find(params[:id])
    end

end
