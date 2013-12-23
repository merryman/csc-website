require 'google_drive/csc_files'

class GranteesController < ApplicationController
  
  def proposal
  end

  def training
    @training_ppts = CSCFiles.session.file_by_title('csc-criteria')
  end

  def criteria
    @criteria_doc = CSCFiles.session.file_by_title('csc-criteria')
  end
end
