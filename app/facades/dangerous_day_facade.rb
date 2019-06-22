class DangerousDayFacade

  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end

  def date_range
    start = Date.parse(@start_date).strftime("%B %-d, %Y")
    finish = Date.parse(@end_date).strftime("%B %-d, %Y")
    "#{start} - #{finish}"
  end

end