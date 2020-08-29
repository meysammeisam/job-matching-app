class CreateCandidatePreferredLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :candidate_preferred_locations do |t|
      t.references :candidate, null: false, foreign_key: true
      t.references :district, null: false, foreign_key: true

      t.timestamps
    end

    add_index :candidate_preferred_locations,
              %i[candidate_id district_id],
              unique: true,
              name: 'index_candidate_preferred_locations_on_candidate_and_district'
  end
end
