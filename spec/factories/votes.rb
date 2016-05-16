FactoryGirl.define do
  factory :vote do
    value RandomData.random_value
    post
    user
  end
end
