# Axiomus API

[![Build Status](https://travis-ci.org/kinderly/axiomus_api.svg)](https://travis-ci.org/kinderly/axiomus_api)
[![Gem Version](https://badge.fury.io/rb/axiomus_api.png)](http://badge.fury.io/rb/axiomus_api)
[![Coverage Status](https://coveralls.io/repos/kinderly/axiomus_api/badge.png)](https://coveralls.io/r/kinderly/axiomus_api)
[![Code Climate](https://codeclimate.com/github/kinderly/axiomus_api.png)](https://codeclimate.com/github/kinderly/axiomus_api)
[![Dependency Status](https://gemnasium.com/kinderly/axiomus_api.svg)](https://gemnasium.com/kinderly/axiomus_api)

## Description

This is a Ruby wrapper over [Axiomus](http://www.axiomus.ru "axiomus.ru") delivery service public [API](http://www.axiomus.ru/customers/api/ "Axiomus API").

All methods exposed by the API by 2014-04-04 are implemented.

## Installation

To install this gem type the following in your command line:
```bash
  gem install axiomus_api
```
If you are using Bundler add the following line to your Gemfile:
```ruby
  gem 'axiomus_api'
```

If you prefer to install the most up-to-date development version, add

```ruby
  gem 'axiomus_api', git: 'git@github.com:kinderly/axiomus_api.git', branch: 'master'
```
## Usage

To access Axiomus API you have to know two values: **oid** and **ukey**.

`AxiomusApi::Session` is a main class to communicate with API.

```ruby
  @uid = '92' # your uid goes here
  @ukey = 'XXcd208495d565ef66e7dff9f98764XX' # your ukey goes here
  @test = true # use test API?
  @session = AxiomusApi::Session.new(@uid, @ukey, @test)
```

You can construct a test session easily (using test credentials provided by Axiomus):
```ruby
  @session = AxiomusApi.test_session
```

Names of methods of `AxiomusApi::Session` are the same as those described in the [API documentation](http://www.axiomus.ru/customers/api/ "Axiomus API").

### Getting regions info
```ruby
  @region_info = @session.get_regions()
```

### Creating and updating an order

To create an order you'll have to construct an order object and fill all its fields according to the documentation. Please note, that different requests use different order types.

```ruby
  # Simple delivery order ('new' and 'update' methods)

  @order = AxiomusApi::Order.new
  # fill order fields
  @response = @session.new(@order)
  #update some order fields
  @response = @session.update(@order)

  # Pickup order ('new_carry' and 'update_carry' methods)
  @order = AxiomusApi::CarryOrder.new
  # fill order fields
  @response = @session.new_carry(@order)
  #update some order fields
  @response = @session.update_carry(@order)
```

Here's a list of session methods and their corresponding order types:
* `new`, `update` => `AxiomusApi::Order`
* `new_carry`, `update_carry` => `AxiomusApi::CarryOrder`
* `new_export`, `update_export` => `AxiomusApi::ExportOrder`
* `new_self_export`, `update_self_export` => `AxiomusApi::SelfExportOrder`
* `new_post`, `update_post` => `AxiomusApi::PostOrder`
* `new_dpd`, `update_dpd` => `AxiomusApi::DpdOrder`
* `new_ems`, `update_ems` => `AxiomusApi::EmsOrder`
* `new_region_courier`, `update_region_courier` => `AxiomusApi::RegionCourierOrder`
* `new_region_pickup`, `update_region_pickup` => `AxiomusApi::RegionPickupOrder`

You can also specify the Axiomus method as a symbol, using `AxiomusApi::Session#send_order_request` method

```ruby
  # EMS order ('new_ems' and 'update_ems' methods)
  @order = AxiomusApi::EmsOrder.new
  # fill order fields
  @response =  @session.send_order_request(:new_ems, @order)
  #update some order fields
  @response =  @session.send_order_request(:update_ems, @order)
```

Most orders use `AxiomusApi::Item` as their item type, but some don't. To safely create an item of a proper type, use `#add_item` method of your order's `#items` field:

```ruby
  @order = AxiomusApi::EmsOrder.new
  @my_item = @order.items.add_item
  @my_item.name = 'My awesome product'
  @my_item.weight = 0.3
  # set other fields
```

### Getting order status
```ruby
  @okey = '642d208495dtgu8906e7dff9f98764da' # your okey goes here
  @status = @session.status(@okey)
```

### Error handling

Before sending a request, the library will validate your order object to check for missing fields or wrong type of parameters. If there are errors, it will raise an `AxiomusApi::Errors::ValidationError` exception. List of errors can be accessed via the order's `#validation_errors` method. Please note that passing validation doesn't necessarily mean the order will be accepted by Axiomus.

If any kind of order request returns with an Axiomus status other than 0, the session will raise an `AxiomusApi::Errors::RequestError` exception.


