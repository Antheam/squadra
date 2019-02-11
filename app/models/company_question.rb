class CompanyQuestion < ApplicationRecord
  belongs_to :company
  belongs_to :question
end
