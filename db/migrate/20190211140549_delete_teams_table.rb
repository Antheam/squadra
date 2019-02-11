class DeleteTeamsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :teams
  end
end
