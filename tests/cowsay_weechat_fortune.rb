require 'minitest/autorun'
require './lib/cowsay_weechat_fortune.rb'

class TestCowsayFortune < MiniTest::Unit::TestCase

  def testGetCowFortune
    cow_fortune = get_cow_fortune
    assert cow_fortune.kind_of?(String), "get_cow_fortune() returns a string."

    refute_empty cow_fortune, "get_cow_fortune() does not return an empty string."
  end

end
