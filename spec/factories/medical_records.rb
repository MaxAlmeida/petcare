FactoryBot.define do
  factory :medical_record do
    pet
    symptoms { "MyText" }
    treatment { "MyText" }
  end
end
