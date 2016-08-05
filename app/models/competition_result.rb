class CompetitionResult < ApplicationRecord
  belongs_to :athlete
  belongs_to :competition
end
