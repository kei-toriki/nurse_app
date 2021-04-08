FactoryBot.define do
  factory :question do
    title                 { Faker::Name.initials(number: 2) }
    explanation           { 'aaaaaaaaaaaaaa' }
    genre_id              { 2 }
    association :user
  end
end
