class CandidateWorkingHour < ApplicationRecord
  belongs_to :candidate

  validates :candidate, :starts_at, :ends_at, presence: true
  validates_datetime :starts_at, before: :ends_at
end
