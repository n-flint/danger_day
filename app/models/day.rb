class Day
  attr_reader :day,
              :id,
              :name,
              :asteroids,
              :date

  def initialize(day)
    @day = day
    @date = day.first
    @id = day[1][0]['neo_reference_id']
    @name = day[1][0]['name']
    @asteroids = asteroids
  end

  def asteroids
      @day.second.map do |asteroid|
        Asteroid.new(asteroid, date)
    end
  end
end