require 'google_drive/csc_files'

class CouncilMemberGoogle
  
  attr_reader :picture_url, :first_name, :last_name, :description, :college_name
  
  
  def initialize(picture_url, first_name, last_name, description, college_name = '')
    @picture_url = picture_url
    @first_name = first_name
    @last_name = last_name
    @description = description
    @college_name = college_name
  end
  
  def self.voting_members
    self.extract_members(CSCFiles.get('people', 'voting-members'))
  end
  
  def self.staff_members
    self.extract_members(CSCFiles.get('people', 'staff-members'))
  end
  
  def self.community_members
    self.extract_members(CSCFiles.get('people', 'community-members'))
  end
  
  private
    
    def self.extract_members(folder)
      files = folder.files
      if files.empty?
        raise 'The folder %s is empty!' % folder.title
      end
      ws = files.first.worksheets[0]
      # drop the first row, which contains only descriptions of the cells
      ws.rows.drop(1).map { |member|
        CouncilMemberGoogle.new(*member)
      }
    end
  
end