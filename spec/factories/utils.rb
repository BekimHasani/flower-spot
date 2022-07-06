FactoryBot.define do
  factory :user do
    email { "filanfisteku@gmail.com" }
    username { "filanfisteku" }
    password { "1234" }
  end
end

FactoryBot.define do
  factory :flower do
    name {"Orhide"}
  end
end

FactoryBot.define do
  factory :sighting do
    longitude {"1234.33"}
    latitude {"3215.66"}
  end
end

FactoryBot.define do
  factory :like do
  end
end