require 'google_drive/csc_files'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def contact
    
  end
  
  def join
    @join_statement = CSCFiles.session.file_by_title('csc-join')
  end
  
end
