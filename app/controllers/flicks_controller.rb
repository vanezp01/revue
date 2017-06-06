class FlicksController < ApplicationController
  before_action :find_flick, only: [:show, :edit, :update, :destroy]
  
  def index
    @flicks = Flick.all.order("created_at DESC")
  end

  def show
  end

  def new
    @flick = Flick.new
  end

  def create
    @flick = Flick.new(flick_params)

    if @flick.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def flick_params
    params.require(:flick).permit(:title, :description, :director)
  end

  def find_flick
    @flick = Flick.find(params[:id])
  end
end
