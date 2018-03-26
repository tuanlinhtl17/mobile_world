class SearchForm
  include ActiveModel::Validations

  attr_reader :min, :max, :query

  def initialize params = {}
    @min = params[:min]
    @max = params[:max]
    @query = params[:query]
  end

  def search
    if @min.present? && @max.present? && @query.present?
     @mobiles = Mobile.search_by_query(@query)
                      .search_in_range(@min.to_i, @max.to_i)
    elsif @query.present?
      @mobiles = Mobile.search_by_query(@query)
    elsif @min.present? && @max.present?
     @mobiles = Mobile.search_in_range(@min.to_i, @max.to_i)
    else
      @mobiles = Mobile.all
    end
  end
end