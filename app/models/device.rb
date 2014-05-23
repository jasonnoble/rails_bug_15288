require 'mac_address'

class Device < ActiveRecord::Base
  def self.find_by_mac_address(address)
    super(MacAddress.new(address).normalized)
  end
end
