FactoryBot.define do
  
  factory :user do
    title { Faker::Name.name }
    subtitle { Faker::Job.title }
    image { {io: File.open("#{Rails.root}/spec/fixtures/files/jest1.jpg"), filename: "jest1.jpg" } }
    body { Faker::Lorem.sentences(3) }
    email { Faker::Internet.email }
    linkedin { Faker::Internet.url }
  end

end