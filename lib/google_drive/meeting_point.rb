require 'google_drive/csc_files'

class MeetingPointGoogle
  
  def self.get_meeting_spot
    @welcome_folder = CSCFiles.get('about-us')
    spot = @welcome_folder.file_by_title('csc-meeting-spot').worksheets[0].cells.values
    {:lat => spot[0].to_f, :lng => spot[1].to_f}
  end
  
end
