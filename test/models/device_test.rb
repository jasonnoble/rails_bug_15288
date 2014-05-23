require 'test_helper'

class DeviceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "#find_by_mac_address(address)" do
    Device.create(mac_address: '1234567890')

    assert Device.find_by_mac_address('1234567890')
    assert Device.find_by_mac_address('12 34 56 78 90')
    assert Device.find_by_mac_address('12:34:56:78:90')
  end
end
