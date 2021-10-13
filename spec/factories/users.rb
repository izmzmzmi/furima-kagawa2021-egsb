FactoryBot.define do
  factory :user do
    nickname {"test"}
    email {"test20211011@gmail.com"}
    password {"abcd1234"}
    password_confirmation {"abcd1234"}
    last_name {"山田"}
    first_name {"太郎"}
    last_name_kana {"ヤマダ"}
    first_name_kana {"タロウ"}
    user_birth_date {"2000-01-01"}
  end
end