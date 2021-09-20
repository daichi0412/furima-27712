FactoryBot.define do
  factory :item do
    name                    {"テスト"}
    comment                 {"テストを送信します"}
    user_id                 {"1"}
    category_id             {2}
    status_id               {2}
    fee_id                  {2}
    prefecture_id           {2}
    scheduled_delivery_id   {2}
    price                   {"500"}

    after(:build) do |item|
      item.image.attach(io: File.open('spec/factories/fixtures/output-image2.png'), filename: 'output-image2.png', content_type: 'image/png')
    end
  end
end
