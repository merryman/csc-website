class TimeFrame < ActiveRecord::Base
  
  def number_of_days
    Date.parse(self.end_date.to_s).mjd - Date.parse(self.start_date.to_s).mjd
  end
  
end
