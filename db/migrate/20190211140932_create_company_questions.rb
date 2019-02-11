class CreateCompanyQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :company_questions do |t|
      t.integer :company_id
      t.integer :question_id

      t.timestamps
    end
  end
end
