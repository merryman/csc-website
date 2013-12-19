class StatusUpdate < ActiveRecord::Base
  
  def self.save_status_update(content)
    create!(:date => Date.today, :content => content)
  end
  
end
