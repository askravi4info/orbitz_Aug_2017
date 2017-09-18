Given(/^user is on Orbitz home page$/) do
  visit OrbitzHomePage
end

And(/^user selects round trip button under flights tab$/) do
  on_page(OrbitzHomePage) do |page|
    page.select_flight_tab
    page.select_flight_type_roundtrip
  end
end

When(/^user enter (.*) in flying from edit box and selects (.+) option$/) do |city_name, airport_name|
  on(OrbitzHomePage).select_dep_airport city_name, airport_name
end

When(/^user enter (.*) in flying to edit box and selects (.*) option$/) do |city_name, airport_name|
  on(OrbitzHomePage).select_arr_airport city_name, airport_name
end


And(/^user enters (future|past) date in Departing edit box$/) do |past_or_future|
  on(OrbitzHomePage) do |page|
    if past_or_future == 'future'
      page.select_dep_date 2
    else
      page.select_dep_date -2
    end

  end
end

And(/^user enters (future|past) date in Arrival edit box$/) do |past_or_future|
  # on(OrbitzHomePage).select_arr_date past_or_future
  if past_or_future == 'future'
    on(OrbitzHomePage).select_arr_date 2
  else
    on(OrbitzHomePage).select_arr_date -2
  end
end

And(/^click on search button$/) do
  on(OrbitzHomePage).search_button_element.click

end

Then(/^verify flight search results page is displayed$/) do
  # on(OrbitzFlightSearchResultsPage).verify_search_results_are_displayed?
  results_title = on(OrbitzFlightSearchResultsPage).get_search_results_title
  fail "Search results are not correct" unless results_title.include? 'Select your departure to '
  # expect(results_title).should include('Select your departure to ')
end

Then(/^user should see the following message$/) do |table|
  # table is a table.hashes.keys # => [:Please complete the highlighted origin field below.]
  table.hashes.each do |each_value|
    # p each_value['error_messages']
    # on(OrbitzHomePage).verify_error_message_exists? each_value['error_messages']
    all_error_messages = on(OrbitzHomePage).get_error_messages
    # fail "#{each_value['error_messages']} is NOT displayed in all Error Messages - #{all_error_messages}" unless all_error_messages.include? each_value['error_messages']
    expect(all_error_messages).should include each_value['error_messages']
  end
end