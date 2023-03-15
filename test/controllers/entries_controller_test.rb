require "test_helper"

class EntriesControllerTest < ActionDispatch::IntegrationTest

  service = Selenium::WebDriver::Service.chrome(path: "/usr/local/bin/chromedriver")
  driver = Selenium::WebDriver.for :chrome, service: service


  test "get homepage" do 
    driver.get('http://localhost:3000/welcome')
    all_entries = driver.find_element(class_name="title is-3")
    expect(all_entries).to eq('All Entries')

    # driver.manage.timeouts.implicit_wait = 500
    # driver.quit
  end


  # test for creating a new entry
  # test "create new entry" do 
  #   get "/entries/new"
  #   assert_response :success
  #   params = {name: "create test", link: "www.linkcreate.com", notes: "test notes"}
  #   assert_response :redirect
  #   follow_redirect!
  #   assert_response :success
  #   assert_select "h1", "create test"
  # end



  # test for showing an entry

  # test to edit entry




end
