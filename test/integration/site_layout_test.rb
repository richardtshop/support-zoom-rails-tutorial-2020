
# frozen_string_literal: true
require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select("a[href=?]", root_path, 2)
    assert_select("a[href=?]", help_path)
    assert_select("a[href=?]", about_path)
    assert_select("a[href=?]", contact_path)
    assert_select("a[href=?]", signup_path)
    user = users(:richard)
    log_in_as(user)
    get root_path
    assert_select("a[href=?]", logout_path)
    assert_select("a[href=?]", users_path)
    assert_select("a[href=?]", user_path(user))
    assert_select("a[href=?]", edit_user_path(user))
  end

  test "footer date" do
    get root_path
    assert_select('small',  /©#{Date.current.year}/)
  end
end
