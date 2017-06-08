class FlicksController < ApplicationController
  before_action :find_flick, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    if params[:category].blank?
      @flicks = Flick.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @flicks = Flick.where(:category_id => @category_id).order("created_at DESC")
    end
  end

  def show
    if @flick.reviews.blank?
			@average_review = 0
		else
			@average_review = @flick.reviews.average(:rating).round(2)
		end
	end

  def new
    @flick = current_user.flicks.build
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def create
    @flick = current_user.flicks.build(flick_params)
    @flick.category_id = params[:category_id]

    if @flick.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def update
    @flick.category_id = params[:category_id]

    if @flick.update(flick_params)
      redirect_to flick_path(@flick)
    else
      render 'edit'
    end
  end

  def destroy
    @flick.destroy
    redirect_to root_path
  end

  private

  def flick_params
    params.require(:flick).permit(:title, :description, :director, :category_id, :flick_img)
  end

  def find_flick
    @flick = Flick.find(params[:id])
  end
end
