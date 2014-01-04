require 'google/api_client'
require 'google/api_client/client_secrets'
require 'google/api_client/auth/file_storage'
require 'google/api_client/auth/installed_app'

module CSCFiles
  
  # a wrapper class, that receives all the information about 
  # the google docs owned by the csc from google drive
  
  # this needs to be changed when deployed on heroku
  API_VERSION = 'v2'
  CACHED_API_FILE = "drive-#{API_VERSION}.cache"
  CREDENTIAL_STORE_FILE = "#{$0}-oauth2.json"
  
  def self.refresh_session!
    if @client.authorization.expired?
      @session = self.setup
    end
  end
  
  def self.website_folder
    self.refresh_session!
    @session.collection_by_url('https://drive.google.com/a/ucsc.edu/#folders/0B8hzPqyoif6vazE3akV0aTVVXzA')
  end
  
  def self.session
    self.refresh_session!
    @session
  end
  
  private
    def self.setup

      client = Google::APIClient.new(
             :application_name => 'Ruby Drive sample',
             :application_version => '1.0.0')

      key = Google::APIClient::PKCS12.load_key('bin/1606c7131271af565f2f45a6928fbc56ecce2f95-privatekey.p12', 'notasecret')
      service_account = Google::APIClient::JWTAsserter.new(
            '892114311045-lpijo4eovim6nip8hhjb92b8rgeagbe8@developer.gserviceaccount.com',
            ['https://www.googleapis.com/auth/drive', 
                       'https://spreadsheets.google.com/feeds',
                       'https://docs.google.com/feeds/'],
            key)
      client.authorization = service_account.authorize
      @client = client
      @token = client.authorization.access_token
      GoogleDrive.login_with_oauth(@token)
    end
    
    @session = self.setup
end