class User < ApplicationRecord
  has_many :answers
  has_many :user_teams
  has_many :teams, through: :user_teams

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, uniqueness: true
  validates :gender, inclusion: { in: ["Male", "Female" ,"Non-Binary", "Rather not say"] }
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }
end
