class CreateSurveyExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :survey_exercises do |t|
      t.text :body
      t.integer :user_id
      t.decimal :rating

      t.timestamps
    end
  end
end

