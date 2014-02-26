FactoryGirl.define do 
  
  factory :user do 
    name { Faker::Name.name }
    title "Worker"
    photo_url "http://placekitten.com/g/200/300"
    email { Faker::Internet.email}
    password "winner"
    password_confirmation "winner"
  end 

  trait :superuser do 
    superuser true
  end 

end 