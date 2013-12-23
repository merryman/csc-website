
class ResourcesController < ApplicationController
  
  def index
  end
  
  def blueprint
    @blueprint = CSCFiles.session.file_by_title('blueprint')
  end

  def links
  end
end
