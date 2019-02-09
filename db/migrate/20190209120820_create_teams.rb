class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :bio
      t.integer :company_id

      t.timestamps
    end
  end
end
