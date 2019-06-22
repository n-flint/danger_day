class MostDangerousDayController < ApplicationController
  def index
    # require 'pry'; binding.pry
    render locals: {
      facade: DangerousDayFacade.new(params['start_date'], params['end_date'])
    }
  end
end
