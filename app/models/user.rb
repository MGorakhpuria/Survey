class User < ApplicationRecord

  # Validation
  validates :name, :email, presence: true

  # Association
  has_many :survey_exercises
end
