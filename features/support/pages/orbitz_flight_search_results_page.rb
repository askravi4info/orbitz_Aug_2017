class OrbitzFlightSearchResultsPage
  include PageObject


  span(:search_results_title, :class => 'title-city-text')

  def verify_search_results_are_displayed?

    fail "Search results are not correct" unless search_results_title_element.wait_until_present.text.include? 'Select your departure to '

  end


end