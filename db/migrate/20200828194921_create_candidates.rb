class CreateCandidates < ActiveRecord::Migration[6.0]
  def change
    create_table :candidates do |t|
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end

    add_index :candidates, :email, unique: true
  end
end
