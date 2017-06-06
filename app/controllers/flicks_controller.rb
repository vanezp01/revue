class FlicksController < ApplicationController

  def index
  end

  def new
    @flick = Flick.new
  end

  def create
    @flick = Flick.new(flick_params)
  end

  private

  def flick_params
    params.require(:play).permit(:title, :description, :director)
  end
end
