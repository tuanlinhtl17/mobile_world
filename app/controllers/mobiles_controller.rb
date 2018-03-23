class MobilesController < ApplicationController
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
    @mobile = Mobile.find_by id: params[:id]
  end
end
