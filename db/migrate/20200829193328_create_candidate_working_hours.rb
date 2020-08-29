class CreateCandidateWorkingHours < ActiveRecord::Migration[6.0]
  def change
    create_table :candidate_working_hours do |t|
      t.references :candidate, null: false, foreign_key: true, index: true
      t.datetime :starts_at, null: false
      t.datetime :ends_at, null: false

      t.timestamps
    end
  end
end
