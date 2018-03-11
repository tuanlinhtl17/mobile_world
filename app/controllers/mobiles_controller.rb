class MobilesController < ApplicationController
  def index
    if params[:min].present? && params[:max].present?
     @mobiles = Mobile.search(params[:search]).search_in_range(params[:min].to_i,
                                                              params[:max].to_i)
                                              .page params[:page]
    else
      @mobiles = Mobile.search(params[:search]).page params[:page]
    end

    @amount = @mobiles.size

    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
  end

  def search
    if params[:search].present?
      @mobiles = Mobile.search params[:search]
    end

    respond_to do |format|
      format.js
    end
  end
end
