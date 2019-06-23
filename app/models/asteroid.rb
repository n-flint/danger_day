class Asteroid
  attr_reader :neo_id,
              :name,
              :dangerous,
              :date

  def initialize(asteroid, date)
    @date = date
    @neo_id = asteroid['neo_reference_id']
    @name = asteroid['name']
    @dangerous = asteroid['is_potentially_hazardous_asteroid']
  end

end