class District < ApplicationRecord
  has_many :jobs, foreign_key: :location_id, inverse_of: :location
  has_many :candidate_preferred_locations, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
