module OrbitzUtilities
  def select_airport airport_name
    all_airports_element.wait_until_present.lis.each do |each_airport|
      p each_airport.text
      if each_airport.text.include? airport_name
        each_airport.click
        break
      end
    end
  end

  def change_date no_of_days
    (Time.now+60*60*24*no_of_days).strftime('%m/%d/%Y')
  end

end