module ApplicationHelper
  def datetime_formatter(datetime)
    datetime.strftime('%d/%m/%Y %H:%M')
  end
end
