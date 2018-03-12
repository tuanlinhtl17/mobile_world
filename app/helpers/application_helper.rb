module ApplicationHelper
  def makers
    @makers = Maker.all
  end
end
