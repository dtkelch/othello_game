require "main.rb"
require "test/unit"

class TestMain < Test::Unit::TestCase

    def test_room()
        main = Main.new()
        assert_equal("Hello World!", main.start)
    end
end
