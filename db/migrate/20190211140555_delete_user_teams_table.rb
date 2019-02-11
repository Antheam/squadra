class DeleteUserTeamsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :user_teams
  end
end
