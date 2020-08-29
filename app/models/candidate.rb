class Candidate < ApplicationRecord
  has_many :working_hours, class_name: 'CandidateWorkingHour', dependent: :destroy
  has_many :candidate_preferred_job_types, dependent: :destroy
  has_many :preferred_job_types,
           through: :candidate_preferred_job_types,
           class_name: 'JobType',
           source: :job_type
  has_many :candidate_preferred_locations, dependent: :destroy
  has_many :preferred_locations,
           through: :candidate_preferred_locations,
           class_name: 'District',
           source: :district

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
end
