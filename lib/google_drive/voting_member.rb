require 'google_drive/csc_files'

class VotingMemberGoogle
  
  attr_reader :picture_url, :first_name, :last_name, :description
  
  def initialize(picture_url, first_name, last_name, description)
    @picture_url = picture_url
    @first_name = first_name
    @last_name = last_name
    @description = description
  end
  
  def self.fetchAll
    if not @members
      self.refresh
    end
    @members 
  end
  
  def self.refresh
    ws = CSCFiles.session.spreadsheet_by_title('voting-members').worksheets[0]
    @members = ws.rows.map { |member|
      VotingMemberGoogle.new(*member)
    }
  end
  
end