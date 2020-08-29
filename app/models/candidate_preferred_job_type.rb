class CandidatePreferredJobType < ApplicationRecord
  belongs_to :candidate
  belongs_to :job_type

  validates :candidate, :job_type, presence: true
  validates :candidate_id, uniqueness: { scope: :job_type_id }
end
