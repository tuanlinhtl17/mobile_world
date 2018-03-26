class MobilesController < ApplicationController
  before_action :load_mobile, only: :show
  load_and_authorize_resource

  def index
    @mobiles = Mobile.send :search, {min: params[:min], max: params[:max],
                                     query: params[:search]}
    @amount = @mobiles.size
    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end

  def search
    if params[:search].present?
      @mobiles = Mobile.search_by_query params[:search]
    end

    respond_to do |format|
      format.js
    end
  end

  def show
    @shop = Shop.new
    @comments = Comment.search_comments(params[:id], nil).page(params[:page]).per(
      Settings.kaminari.paginate_comment)
    @comment = @mobile.comments.build
    respond_to do |format|
      format.html
      format.js {render layout: false}
    end
  end
  
  private
  
  def load_mobile
    @mobile = Mobile.find_by id: params[:id]
    return if @mobile
    redirect_to root_path
    flash[:danger] = t("flash.load_mobile") + params[:id]
  end
end
