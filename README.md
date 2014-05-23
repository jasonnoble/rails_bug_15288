== README

This test repo is to help show the problem that is documented
at https://github.com/rails/rails/issues/15288

Steps to reproduce:

* Clone the repo
* rake db:migrate
* rails console

```ruby
>> Device.create(mac_address: '1234567890')
>> m1 = Device.method(:find_by_mac_address)
=> #<Method: Device(id: integer, mac_address: string, created_at: datetime, updated_at: datetime).find_by_mac_address>
>> m1.source_location
=> ["SANITIZED_PATH/bug_15288/app/models/device.rb", 4]
>> Device.find_by_mac_address('1234567890')
  Device Load (0.2ms)  SELECT  "devices".* FROM "devices"  WHERE "devices"."mac_address" = '1234567890' LIMIT 1
=> #<Device id: 1, mac_address: "1234567890", created_at: "2014-05-23 23:00:15", updated_at: "2014-05-23 23:00:15">
>> m2 = Device.method(:find_by_mac_address)
=> #<Method: Device(id: integer, mac_address: string, created_at: datetime, updated_at: datetime).find_by_mac_address>
>> m2.source_location
=> ["/usr/local/rvm/gems/ruby-2.1.2@rails4.1/gems/activerecord-4.1.1/lib/active_record/dynamic_matchers.rb", 69]
>>
```
