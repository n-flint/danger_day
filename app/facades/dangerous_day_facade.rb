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

  def dangerous_days
    service.map { |day| day.asteroids.keep_if { |asteroid| asteroid.dangerous}}
  end

  def dangerous_date
    date = dangerous_days.max_by { |asteroids| asteroids.size }.reverse.first.date
    Date.parse(date).strftime("%B %-d, %Y")
  end

  def dangerous_day_roids
    dangerous_days.sort_by { |asteroids| asteroids.size }.reverse.first
  end

  private

    def service
      #need to interpolate the ENV key
      
      # require 'pry'; binding.pry
      # conn = Faraday.new('https://api.nasa.gov/neo/rest/v1/feed?start_date=2018-01-01&end_date=2018-01-07') do |f|
      #   f.params['api_key'] = ENV['NASA_API_KEY']
      #   f.adapter Faraday.default_adapter
      # end
      # response = conn.get
      conn = Faraday.get("https://api.nasa.gov/neo/rest/v1/feed?start_date=2018-01-01&end_date=2018-01-07&api_key=KB3hwEcqUPr4Z8IUDLwwy0SLMY8yja4SgGT1Jt8S")
      data = JSON.parse(conn.body)
      days = data['near_earth_objects'].map do |day|
        Day.new(day)
      end
    end
end
