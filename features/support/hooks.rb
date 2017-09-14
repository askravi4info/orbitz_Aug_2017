# require 'watir'
require 'watir-webdriver'

Before do |scenario|
  DataMagic.load_for_scenario(scenario)
  @browser = Watir::Browser.new :chrome
end


After do
  @browser.close
end