class StatisticsController < ApplicationController
  def index
    @athletes = Athlete.all
  end
end
