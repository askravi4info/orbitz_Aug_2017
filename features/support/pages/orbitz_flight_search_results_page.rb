class OrbitzFlightSearchResultsPage
  include PageObject


  span(:search_results_title, :class => 'title-city-text')
  spans(:all_prices, :class => 'dollars price-emphasis')


  # def verify_search_results_are_displayed?
  #   fail "Search results are not correct" unless search_results_title_element.wait_until_present.text.include? 'Select your departure to '
  # end

  def get_search_results_title
    search_results_title_element.wait_until_present.text
  end

  def get_price_details
    final_prices = []
    sleep 3
    all_prices_elements.each do |price|
      final_prices << price.text.sub('$','').sub(',','').to_i
    end
    p final_prices
  end


end