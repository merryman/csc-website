require 'google_drive/csc_files'
require 'american_date' # yes, you are reading correctly...

class TimeFrameGoogle
  
  attr_reader :start_date, :end_date, :name, :description
  
  def initialize(start_date, end_date, name, description)
    @start_date = DateTime.parse(start_date)
    @end_date = DateTime.parse(end_date)
    @name = name
    @description = description
  end
  
  def number_of_days
    Date.parse(self.end_date.to_s).mjd - Date.parse(self.start_date.to_s).mjd
  end
    
  def self.fetchAll
    self.refresh
    @timeframes 
  end

  def self.refresh
    ws = CSCFiles.session.spreadsheet_by_title('csc-timeframes').worksheets[0]
    @timeframes = ws.rows.map { |tf|
      TimeFrameGoogle.new(*tf)
    }
  end
  
  def self.allForTimeline
    now = DateTime.now
    self.fetchAll.map { |tf| 
      {:value => tf.number_of_days,
       :past_frame => (tf.start_date < now),
       :todays_frame => (tf.start_date < now and now < tf.end_date), 
       :timeframe => tf}}
  end
  
end
