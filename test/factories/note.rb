FactoryGirl.define do

  factory :note do
    title {Faker::Book.title}
    body {Faker::Lorem.sentences(2).first}
    tag_names {Faker::Lorem.words(4).join(", ")}

  end
end
