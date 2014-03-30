#coding: utf-8

FactoryGirl.define do
  sequence :inner_id do |n|
    n
  end

  sequence :sms do |n|
    (79030000000+n).to_s
  end

  sequence :boolean do
    ['yes', 'no'][rand(0..1)]
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

  factory :services, class: AxiomusApi::Services do
    cash {generate :boolean}
    cheque {generate :boolean}
    card {generate :boolean}
    big {generate :boolean}
  end

  factory :export_services, class: AxiomusApi::ExportServices do
    transit {generate :boolean}
    warrant {generate :boolean}
  end

  factory :post_services, class: AxiomusApi::PostServices do
    valuation {generate :boolean}
    fragile {generate :boolean}
    cod {generate :boolean}
    big {generate :boolean}
  end

  factory :regions_services, class: AxiomusApi::RegionsServices do
    cheque {generate :boolean}
    not_open {generate :boolean}
    extrapack {generate :boolean}
    big {generate :boolean}
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
    services {build(:services)}

    after(:build) do |order|
      rand(1..10).times do
        order.items << build(:item)
      end
    end
  end

  factory :post_address, class: AxiomusApi::PostAddress do
    index '344018'
    region 'обл Ростовская'
    area 'Ростов-на-Дону'
    p_address 'пер. Соборный, д61, кв21'
  end

  factory :ems_address, class: AxiomusApi::EmsAddress do
    index '344018'
    area 'Ростов-на-Дону'
    street 'пер Соборный'
    house '61'
    apartment '21'
  end

  factory :dpd_address, class: AxiomusApi::DpdAddress, parent: :ems_address do
    region 'обл Ростовская'
  end

  factory :regions_courier_address, class: AxiomusApi::RegionsCourierAddress do
    region_code 33
    city_code 29
    index '344018'
    street 'пер. Соборный'
    house 61
    apartment 21
  end

  factory :regions_pickup_address, class: AxiomusApi::RegionsPickupAddress do
    office_code 32
  end

  factory :delivery_order, class: AxiomusApi::DeliveryOrder, parent: :base_order do
    trait :incl_delivery_sum do
      incl_delivery_sum rand(100.0..200.00)
    end

    sms {rand(1..2) ? generate(:sms) : nil}
    d_date {Time.now + rand(1..10)*24*60*60}
    b_time {rand(10..19)}
    e_time {b_time + 3}
    address 'Москва, Живописная, д4 корп1, кв 16'
    city 0
    garden_ring {generate :boolean}
    from_mkad {rand(1..2) == 2 && garden_ring !='yes' && city > 0 ? rand(1..40) : nil}
  end

  factory :pickup_order, class: AxiomusApi::PickupOrder, parent: :base_order do
    sms {rand(1..2) ? generate(:sms) : nil}
    office {[0, 1, nil][rand(0..2)]}
    b_date {Time.now + rand(5..10)*24*60*60}
    e_date {b_date + 7*24*60*60}
  end

  factory :export_order, class: AxiomusApi::ExportOrder, parent: :base_order do
    export_quantity {rand(1..3)}
    transit {generate :boolean}
    d_date {Time.now + rand(1..10)*24*60*60}
    b_time {rand(10..19)}
    e_time {b_time + 3}
    services {build(:export_services)}
    address 'Москва, Живописная, д4 корп1, кв 16'
    garden_ring {generate :boolean}
    from_mkad {garden_ring == 'yes' ? nil : rand(1..40)}

    after(:build) do |order|
      order.items = []
      rand(1..10).times do
        order.items << build(:export_item)
      end
    end
  end

  factory :self_export_order, class: AxiomusApi::SelfExportOrder, parent: :base_order do
    car 'с065мк61'
    d_date {Time.now + rand(1..10)*24*60*60}
    b_time {rand(10..19)}
    e_time {b_time + 3}
    quantity {rand(1..3)}

    after(:build) do |order|
      order.items = []
      rand(1..10).times do
        order.items << build(:export_item)
      end
    end
  end

  factory :post_order, class: AxiomusApi::PostOrder, parent: :base_order do
    d_date {Time.now + rand(1..10)*24*60*60}
    post_type {rand(1..2)}
    address {build(:post_address)}
    services {build(:post_services)}
    contacts {generate(:sms)}
  end

  factory :ems_order, class: AxiomusApi::EmsOrder, parent: :base_order do
    d_date {Time.now + rand(1..10)*24*60*60}
    address {build(:ems_address)}
    services {build(:post_services)}
    contacts {generate(:sms)}
  end

  factory :regions_order, class: AxiomusApi::RegionsOrder, parent: :base_order do
    d_date {(Time.now + rand(5..15)*24*60*60).strftime('%Y-%m-%d')}
    b_time {rand(10..17)}
    e_time {b_time + 1}
    services {build(:regions_services)}
  end

  factory :regions_courier_order, class: AxiomusApi::RegionsCourierOrder, parent: :regions_order do
    address {build(:regions_courier_address)}
  end

  factory :regions_pickup_order, class: AxiomusApi::RegionsPickupOrder, parent: :regions_order do
    address {build(:regions_pickup_address)}
  end

  factory :dpd_order, class: AxiomusApi::DpdOrder, parent: :base_order do
    post_type {rand(1..2)}
    services {build(:post_services)}
    address {build(:dpd_address)}
    d_date {(Time.now + rand(5..15)*24*60*60).strftime('%Y-%m-%d')}
    b_time {rand(10..17)}
    e_time {b_time + 1}
  end

end
