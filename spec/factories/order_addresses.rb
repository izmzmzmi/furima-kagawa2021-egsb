FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code {'111-1111'} 
    prefecture_id {'2'}
    city { 'test-city'}
    addresses { 'test-address' }
    building { 'test-building' }
    phone_number {'08012345678'}
  end
end
