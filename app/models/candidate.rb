class Candidate < ApplicationRecord
  has_many :working_hours, class_name: 'CandidateWorkingHour'

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
end
