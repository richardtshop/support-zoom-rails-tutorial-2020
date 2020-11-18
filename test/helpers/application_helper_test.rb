# typed: false
# frozen_string_literal: true
require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title, "Curds and Whey"
    assert_equal full_title("Help"), "Help | Curds and Whey"
  end
end
