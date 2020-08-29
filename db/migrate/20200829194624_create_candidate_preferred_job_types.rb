class CreateCandidatePreferredJobTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :candidate_preferred_job_types do |t|
      t.references :candidate, null: false, foreign_key: true
      t.references :job_type, null: false, foreign_key: true

      t.timestamps
    end

    add_index :candidate_preferred_job_types,
              %i[candidate_id job_type_id],
              unique: true,
              name: 'index_candidate_preferred_job_types_on_candidate_and_job_type'
  end
end
