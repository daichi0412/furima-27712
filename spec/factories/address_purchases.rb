FactoryBot.define do
  factory :address_purchase do
    code              {"123-4567"}
    prefecture_id     {2}
    city              {"大阪市"}
    address           {"旭区1-1-1"}
    building          {"大阪101"}
    tel               {"09011111111"}
    token             {"tok_abcdefghijk00000000000000000"}
  end
end