require 'google_drive/csc_files'

class TransparencyController < ApplicationController
  
  before_filter :load_folder
  
  def load_folder
    @transparency_folder = CSCFiles.website_folder.subcollection_by_title('transparency')
  end
  
  def agendas
    @agenda_files = @transparency_folder.subcollection_by_title('agendas').files
  end

  def minutes
    @minute_files = @transparency_folder.subcollection_by_title('minutes').files
  end

  def budgets
    @budget_files = {}
    budget_folders = @transparency_folder.subcollection_by_title('budgets')
    @budget_files[:csc] = budget_folders.subcollection_by_title('csc').files
    @budget_files[:sec] = budget_folders.subcollection_by_title('sec').files
    @budget_files[:eslp] = budget_folders.subcollection_by_title('eslp').files
  end

  def constitution
    redirect_to @transparency_folder.subcollection_by_title('constitution').files.first.human_url
  end
  
  def history
  end
end
