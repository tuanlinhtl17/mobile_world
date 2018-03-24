class MakersController < ApplicationController
  def index
  end

  def show
    @maker = Maker.find_by id: params[:id]
    if @maker
      @mobiles = @maker.mobiles.page params[:page]
      @advertisements = Advertisement.maker_newest_ads @maker.id
    else
      flash[:danger] = t "views.makers.error.not_found"
      redirect_to root_path
    end
  end
end
