class SurveyAnswersController < ApplicationController

  before_action :set_user, only: [:create]

  def index
  end

  def create
    @survey_exercise = SurveyExercise.create(user_id: @user.id)
    Question.all.each do |question|  
      if params["question #{question.id}"].present?
        SurveyAnswer.create(user_id: @user.id, question_id: question.id, survey_exercise_id: @survey_exercise.id, answer: params["question #{question.id}"])
      end
    end

    @rating = ((100 * @survey_exercise.survey_answers.count) / Question.count)
    @survey_exercise.update(rating: @rating)

    user_survey_excerise = @user.survey_exercises
    avg_rating = user_survey_excerise.pluck(:rating).sum/user_survey_excerise.count
    @user.update(avg_rating: avg_rating)

    redirect_to survey_exercise_path(@survey_exercise)
  end

  private

  def set_user
    @user = User.find_or_create_by(user_params)
  end

  def user_params
    params.permit(:name, :email)
  end
end

