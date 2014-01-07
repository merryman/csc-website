require 'google_drive/time_frame'
require 'google_drive/meeting_point'
require 'nokogiri'

class WelcomeController < ApplicationController
  
  def index
    html = Nokogiri::HTML(CSCFiles.get('about-us').file_by_title('notification').download_to_string.html_safe)
    notification_html = html.at('//span').parent.children
    notification_html.each do |node|
      node.remove_attribute('class')
    end
    @notification = notification_html.to_s
  end
  
end
