class CreateJobTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :job_types do |t|
      t.string :title
      t.text :description
      t.string :slug

      t.timestamps
    end
    add_index :job_types, :slug, unique: true
  end
end
