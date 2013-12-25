require 'google_drive/csc_files'

class TransparencyController < ApplicationController
  
  def index
  end
  
  def agendas
  end

  def minutes
  end

  def budgets
    @budget_files = {}
    budget_folders = CSCFiles.website_folder.subcollection_by_title('budgets')
    @budget_files[:csc] = budget_folders.subcollection_by_title('csc').files
    @budget_files[:sec] = budget_folders.subcollection_by_title('sec').files
    @budget_files[:eslp] = budget_folders.subcollection_by_title('eslp').files
  end

  def constitution
  end

  def history
  end
end
