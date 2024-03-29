class CreateSurveyAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :survey_answers do |t|
      t.integer :user_id
      t.integer :question_id
      t.integer :survey_exercise_id
      t.boolean :answer
      t.timestamps
    end
  end
end
