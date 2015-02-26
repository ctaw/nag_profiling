module ApplicationHelper
  def format_date(date)
    return date.blank? ? "" : date.strftime("%B %d, %Y")
  end
end
