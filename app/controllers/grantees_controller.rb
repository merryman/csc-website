require 'google_drive/csc_files'

class GranteesController < ApplicationController
  
  before_filter :load_folder
  
  def load_folder
    @grantees_folder = CSCFiles.website_folder.subcollection_by_title('grantees')
  end
  
  def proposal
    rfp = @grantees_folder.subcollection_by_title('proposal')
                          .documents
                          .delete_if { |file| 
                            file.title == 'README.txt' 
                          }
    if rfp.first
      redirect_to rfp.first.human_url
    end 
  end

  def training
    @training_ppts = @grantees_folder.subcollection_by_title('training')
                                     .files.delete_if { |file| 
                                       file.title == 'README.txt' 
                                     }
  end

  def criteria
    @criteria_doc = CSCFiles.session.file_by_title('csc-criteria')
  end
end
