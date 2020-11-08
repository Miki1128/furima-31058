FactoryBot.define do
  factory :item do
    association :user  
    name             {"あああ"}
    description      {"あああ"}
    category_id      {1}
    prefecture_id    {1}
    shipping_cost_id {1}
    status_id        {1}
    shipping_day_id  {1}
    price            {500}   
  
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

