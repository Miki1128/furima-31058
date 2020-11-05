FactoryBot.define do
  factory :user do
    nickname              {"abeabe"}
    email                 {"kkk@gmail.com"}
    password              {"aaa000"}
    password_confirmation {password}
    first_name            {"あア阿"}
    last_name             {"あア阿"}
    first_name_kana       {"アアア"}
    last_name_kana        {"アアア"}
    birth_date            {"1990-01-01"}
  end
end