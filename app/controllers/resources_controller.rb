require 'google_drive/csc_files'

class ResourcesController < ApplicationController

  before_filter :load_folder
  
  def load_folder
    @resources_folder = CSCFiles.website_folder.subcollection_by_title('resources')
  end
  
  def blueprint
    @blueprint = CSCFiles.session.file_by_title('blueprint')
  end

  def links
    @links = CSCFiles.session.file_by_title('csc-links')
  end
end
