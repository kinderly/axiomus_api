FactoryGirl.define do
  sequence :inner_id do |n|
    n
  end

  sequence :sms do |n|
    (79030000000+n).to_s
  end

  factory :base_order, class: AxiomusApi::BaseOrder do
    contacts 'John Galt'
    description 'Awesome description'
    inner_id {rand(1..2)==2 ? generate(:inner_id) : nil}
    name 'John Galt'

    trait :has_okey do
      okey '2e3023c3e78f4f0c8cbb81257743c2d7'
    end

    places {rand(1..2)}
    garden_ring {rand(1..2) == 2 ? 'yes' : 'no'}
    from_mkad {rand(1..2) == 2 && garden_ring !='yes' && city > 0 ? rand(1..40) : nil}
    sms {rand(1..2) ? generate(:sms) : nil}
    city {garden_ring == 'yes' ? 0 : rand(0..200)}

    after(:build) do |order|
      rand(1..10).times do
        order.items << build(:item)
      end
    end
  end

  factory :item, class: AxiomusApi::Item do
    name {"Product #{rand(1..1000)}"}
    weight {rand(0.1..10.0)}
    quantity {rand(1..10)}
    price {rand(0.5..10000.0)}
  end

  factory :export_item, class: AxiomusApi::ExportItem, parent: :item do
    oid {rand(10000..99999)}
  end
end
