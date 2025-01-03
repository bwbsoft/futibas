module ApplicationHelper
  def datetime_formatter(datetime)
    date = datetime.strftime('%d/%m/%Y')
    time = datetime.strftime('%H:%M')
    # calendar_icon = bootstrap_icon('calendar-event-fill')
    # clock_icon = bootstrap_icon('clock-fill')
    "📅 #{date} ⏱️ #{time}".html_safe
  end
end
