require 'google_drive/csc_files'

class ResourcesController < ApplicationController
  
  def index
  end
  
  def blueprint
    @blueprint = CSCFiles.session.file_by_title('blueprint')
  end

  def links
    @links = CSCFiles.session.file_by_title('csc-links')
  end
end
