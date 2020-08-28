class JobType < ApplicationRecord
  has_many :jobs, inverse_of: :job_type

  validates :title, :description, :slug, presence: true
  validates :slug, uniqueness: { case_sensitive: false }
end
