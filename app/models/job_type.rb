class JobType < ApplicationRecord
  has_many :jobs, inverse_of: :job_type, dependent: :restrict_with_error
  has_many :candidate_preferred_job_types, dependent: :destroy

  validates :title, :description, :slug, presence: true
  validates :slug, uniqueness: { case_sensitive: false }
end
