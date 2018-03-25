module ApplicationHelper
  def format_time(time)
    time && time_ago_in_words(time)
  end
end
