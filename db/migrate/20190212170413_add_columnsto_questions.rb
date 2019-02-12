class AddColumnstoQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :q_type, :string
    add_column :questions, :options, :string
  end
end
