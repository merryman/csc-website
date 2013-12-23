require 'google_drive/csc_files'
require 'american_date'

class StatusUpdateGoogle
  
  attr_reader :date, :content
  
  def self.model_name
    'StatusUpdate'
  end
  
  def initialize(date, content)
    @date = DateTime.parse(date)
    @content = content
  end
  
  def self.fetchAll
    #if not @status_updates
      self.refresh
      #end
    @status_updates
  end
  
  def self.refresh
    ws = CSCFiles.session.spreadsheet_by_title('csc-status-updates').worksheets[0]
    @status_updates = ws.rows.map { |su|
      StatusUpdateGoogle.new(*su)
    }
  end
  
  
  
end
