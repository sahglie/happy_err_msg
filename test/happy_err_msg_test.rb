require "test_helper"

class HappyErrMsgTest < ActiveSupport::TestCase
  def setup
    @rando = Rando.new
    @rando.valid?
  end

  test "it excludes the field name" do
    assert_equal(["yeah this is invalid"], @rando.errors.full_messages_for(:field1))
  end

  test "it includes the field name" do
    assert_equal(["Field2 yeah this is invalid"], @rando.errors.full_messages_for(:field2))
  end
end
