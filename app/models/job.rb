class Job < ApplicationRecord
  include JobFilter

  belongs_to :location, class_name: 'District', inverse_of: :jobs
  belongs_to :job_type, inverse_of: :jobs

  validates :title, :description, :location, :job_type, :starts_at, :ends_at, presence: true
  validates_datetime :starts_at, before: :ends_at
end
