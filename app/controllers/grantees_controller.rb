require 'google_drive/csc_files'

class GranteesController < ApplicationController
  
  before_filter :load_folder
  
  def load_folder
    @grantees_folder = CSCFiles.website_folder.subcollection_by_title('grantees')
  end
  
  def proposal
    rfp = @grantees_folder.subcollection_by_title('proposal').documents.first
    if rfp
      redirect_to rfp.human_url
    end 
  end

  def training
    @training_ppts = @grantees_folder.subcollection_by_title('training').files
  end

  def criteria
    @criteria_doc = CSCFiles.session.file_by_title('csc-criteria')
  end
end
