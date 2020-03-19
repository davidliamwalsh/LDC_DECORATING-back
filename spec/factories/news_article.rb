FactoryBot.define do

  factory :news_article do
    image { {io: File.open("#{Rails.root}/spec/fixtures/files/jest1.jpg"), filename: "jest1.jpg" } }
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph(5) }
  end

end