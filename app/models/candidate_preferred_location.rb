class CandidatePreferredLocation < ApplicationRecord
  belongs_to :candidate
  belongs_to :district

  validates :candidate, :district, presence: true
  validates :candidate_id, uniqueness: { scope: :district_id }
end
