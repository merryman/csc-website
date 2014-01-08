require 'google_drive/csc_files'

class TransparencyController < ApplicationController
  
  def view_folder
    folder = CSCFiles.get('transparency', params[:folder_name])
    @folder_name = folder.title
    
    html = Nokogiri::HTML(folder.file_by_title('description').download_to_string.html_safe)
    description_html = html.at('//span').parent.children
    description_html.each do |node|
      node.remove_attribute('class')
    end
    @folder_description = description_html.to_s
    @folder_sections = folder.subcollections
    @top_folder = folder.files.delete_if { |file| file.title == 'description' or file.resource_type == 'folder'}
  end

  def constitution
    redirect_to self.extract_files(CSCFiles.get('transparency', 'constitution')).first.human_url
  end
  
end
