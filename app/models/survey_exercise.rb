class SurveyExercise < ApplicationRecord
  
  # Association
  has_many :survey_answers
  belongs_to :user
end
