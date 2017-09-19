require_relative '../../../features/support/modules/orbitz_utilities_module'
class OrbitzHomePage
  include PageObject
  include OrbitzUtilities

  page_url 'www.orbitz.com'

  link(:select_flight_tab, :id => 'tab-flight-tab')
  label(:select_flight_type_roundtrip, :id => 'flight-type-roundtrip-label')
  text_field(:dep_airport, id: 'flight-origin')
  text_field(:arr_airport, id: 'flight-destination')
  ul(:all_airports, :class => 'results')
  text_field(:dep_date, id: 'flight-departing')
  text_field(:arr_date, id: 'flight-returning')
  button(:search_button, id: 'search-button')

  div(:error_messages, id: 'flight-errors')


  def load_yml_data
    @file = YAML.load_file 'C:\Users\Ravi\Desktop\Projects\orbitz_Aug_2017\features\support\testing.yml'
    p @file.fetch('request')
    p @file['company_name']
    p @file['content']['session']

    File.open('C:\Users\Ravi\Desktop\Projects\orbitz_Aug_2017\features\support\testing.yml','w') {|f|
      @file['company_name'] = 'new_company'
      f.write(@file.to_yaml) }
    p @file['company_name']

  end

  def search_future_flights
    # select_dep_airport 'columbus', 'Columbus, OH'
    # select_arr_airport 'cleveland', 'Cleveland, OH'
    # select_dep_date 2
    # select_arr_date 2
    # search_button_element.click

    @file = YAML.load_file 'C:\Users\Ravi\Desktop\Projects\orbitz_Aug_2017\features\support\testing.yml'
    select_dep_airport @file['dep_city_name'], @file['dep_airport_name']
    select_arr_airport @file['arr_city_name'], @file['arr_airport_name']
    select_dep_date 2
    select_arr_date 2
    search_button_element.click
  end

  def select_dep_airport city_name, airport_name
    self.dep_airport = city_name
    # self.dep_airport_element.send_keys = city_name
    select_airport airport_name
  end

  def select_arr_airport city_name, airport_name
    self.arr_airport = city_name
    # self.dep_airport_element.send_keys = city_name
    select_airport airport_name
  end

  def select_dep_date no_of_days
    self.dep_date = change_date no_of_days
  end

  def select_arr_date no_of_days
    self.arr_date = change_date no_of_days
  end


  def verify_error_message_exists? error_msg

    fail "#{error_msg} is NOT found in the AUT" unless error_messages_element.list_item_elements.map(&:text).include? error_msg
    # error_messages_element.list_item_elements.each do |each_message|
    #   p each_message.text
    #
    #   if each_message.text.include? error_msg
    #     p 'Message Not Exists'
    #     break
    #   end
    # end
  end


  def get_error_messages
    error_messages_element.list_item_elements.map(&:text)
  end


end