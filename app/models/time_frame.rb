require 'date'

class TimeFrame < ActiveRecord::Base
  
  def number_of_days
    Date.parse(self.end_date.to_s).mjd - Date.parse(self.start_date.to_s).mjd
  end
  
  def self.allForTimeline
    now = DateTime.now
    TimeFrame.all.map { |each| 
      {:value => each.number_of_days,
       :past_frame => (each.start_date < now),
       :todays_frame => (each.start_date < now and now < each.end_date), 
       :timeframe => each}}
  end
  
end
