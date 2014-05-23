require 'active_model'

class MacAddress
  def initialize(mac_address)
    @address = mac_address.to_s
  end

  # Public: Strips all non-valid characters from the mac address, including any
  # colons.
  #
  # Returns a string with the downcased, stripped mac address
  def normalized
    @address.downcase.gsub(/[^A-Fa-f0-9]/, '')
  end

  # Returns true if normalized versions of both are equivalent.
  def ==(other)
    other = self.class.new(other) unless other.class == self.class
    normalized == other.normalized
  end
end

