class ChartsController < ApplicationController

  def athletes_by_age
    result = Athlete.group(:age).count
    render json: [{name: 'Count', data: result}]
  end

  def athletes_by_country
    result = {}
    Country.all.map do |c|
      result[c.name] = c.athletes.count
    end
    render json: [{name: 'Count', data: result}]
  end

  def results_by_country
    result = Country.all.map do |c|
      places = {}
      (1..6).each do |place|
        places[place] = c.athletes.joins(:competition_results).where("competition_results.place = #{place}").count
      end
      {
          name: c.name,
          data: places
      }
    end
    render json: result
  end

  def competitions_by_year
    result = CompetitionResult.group_by_year(:created_at, format: "%Y").count
    render json: [{name: 'Count', data: result}]
  end

  def competitions_by_month
    result = CompetitionResult.group_by_month(:created_at, format: "%B").count
    render json: [{name: 'Count', data: result}]
  end




end