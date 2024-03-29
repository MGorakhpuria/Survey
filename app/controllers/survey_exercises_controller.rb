class SurveyExercisesController < ApplicationController
  before_action :set_survey_exercise, only: [:show]

  def show
    @user = @survey_exercise.user
  end

  private

  def set_survey_exercise
    @survey_exercise = SurveyExercise.find_by(id: params[:id])
  end
end
