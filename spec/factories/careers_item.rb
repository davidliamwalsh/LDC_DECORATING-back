FactoryBot.define do
  
  factory :careers_item do
    title { Faker::Job.title }
    job_description { Faker::Lorem.sentences(3) }
    job_type { Faker::Job.employment_type }
    experience { Faker::Lorem.sentence }
    location { Faker::Lorem.sentence }
    drivers_license { Faker::Lorem.sentence }
    language { Faker::Nation.language }
  end

end