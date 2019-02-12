Fabricator :user do
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  gender { Faker::Gender.binary_type}
  email { Faker::Internet.email }
  password { "password" }
  company_id { "1" }
end
