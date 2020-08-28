class JobType < ApplicationRecord
  validates :title, :description, :slug, presence: true
  validates :slug, uniqueness: { case_sensitive: false }
end
