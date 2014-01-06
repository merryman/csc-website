require 'google_drive/csc_files'

class TransparencyController < ApplicationController
  
  before_filter :load_folder
  
  def load_folder
    @transparency_folder = CSCFiles.website_folder.subcollection_by_title('transparency')
  end
  
  def extract_files(folder)
    folder.files.delete_if { |file| file.title == 'README.txt' }
  end
  
  def agendas
    @agenda_files = self.extract_files(CSCFiles.get('transparency', 'agendas'))                           
  end

  def minutes
    @minute_files = self.extract_files(CSCFiles.get('transparency', 'minutes'))
  end

  def budgets
    @budget_files = {}
    @budget_files[:csc] = self.extract_files(CSCFiles.get('transparency', 'budgets', 'csc'))
    @budget_files[:sec] = self.extract_files(CSCFiles.get('transparency', 'budgets', 'sec'))
    @budget_files[:eslp] = self.extract_files(CSCFiles.get('transparency', 'budgets','eslp'))
  end

  def constitution
    redirect_to self.extract_files(CSCFiles.get('transparency', 'constitution')).first.human_url
  end
  
  def history
  end
  
end
