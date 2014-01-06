require 'google_drive/csc_files'

class GranteesController < ApplicationController
  
  before_filter :load_folder
  
  def load_folder
    @proposal_folder = CSCFiles.get('grantees', 'proposal')
    @training_folder = CSCFiles.get('grantees', 'training')
  end
  
  def proposal
    rfp = @proposal_folder.documents.first
    if rfp
      redirect_to rfp.first.human_url
    end 
  end

  def training
    @training_ppts = @training_folder.files.delete_if { |file| file.title == 'README.txt' }
  end

  def criteria
    @criteria_doc = CSCFiles.session.file_by_title('csc-criteria')
  end
  
end
