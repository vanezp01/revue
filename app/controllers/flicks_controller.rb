class FlicksController < ApplicationController
  before_action :find_flick, only: [:show, :edit, :update, :destroy]

  def index
    @flicks = Flick.all.order("created_at DESC")
  end

  def show
  end

  def new
    @flick = current_user.flicks.build
  end

  def create
    @flick = current_user.flicks.build(flick_params)

    if @flick.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
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
    params.require(:flick).permit(:title, :description, :director)
  end

  def find_flick
    @flick = Flick.find(params[:id])
  end
end
