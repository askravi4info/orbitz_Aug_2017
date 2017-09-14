Given(/^user is on Orbitz home page$/) do
  visit OrbitzHomePage
end

And(/^user selects round trip button under flights tab$/) do
  on(OrbitzHomePage).select_flight_tab
  on(OrbitzHomePage).select_flight_type_roundtrip
end

When(/^user enter (.*) in flying from edit box and selects (.+) option$/) do |city_name, airport_name|
  on(OrbitzHomePage).select_dep_airport city_name, airport_name
end

When(/^user enter (.*) in flying to edit box and selects (.*) option$/) do |city_name, airport_name|
  on(OrbitzHomePage).select_arr_airport city_name, airport_name
end


And(/^user enters (future|past) date in Departing edit box$/) do |past_or_future|
  if past_or_future == 'future'
    on(OrbitzHomePage).select_dep_date 2
  else
    on(OrbitzHomePage).select_dep_date -2
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
  on(OrbitzFlightSearchResultsPage).verify_search_results_are_displayed?
end

Then(/^user should see the following message$/) do |table|
  # table is a table.hashes.keys # => [:Please complete the highlighted origin field below.]
  table.hashes.each do |each_value|
    # p each_value['error_messages']
    on(OrbitzHomePage).verify_error_message_exists? each_value['error_messages']


  end
end