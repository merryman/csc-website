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
  
  def self.documents
    @session.files.select { |file|
      file.resource_type == 'document'
    }
  end
  
  def self.spreadsheets
    @session.files.select { |file|
       file.resource_type == 'spreadsheet'
    }
  end
  
  def self.session
    @session
  end
  
  private
    def self.setup
      # Handles authentication and loading of the API.
      log_file = File.open('drive.log', 'a+')
      log_file.sync = true
      logger = Logger.new(log_file)
      logger.level = Logger::DEBUG

      client = Google::APIClient.new(
          :application_name => 'Ruby Drive sample',
          :application_version => '1.0.0')

      # FileStorage stores auth credentials in a file, so they survive multiple runs
      # of the application. This avoids prompting the user for authorization every
      # time the access token expires, by remembering the refresh token.
      # Note: FileStorage is not suitable for multi-user applications.
      file_storage = Google::APIClient::FileStorage.new(CREDENTIAL_STORE_FILE)
      if file_storage.authorization.nil?
        client_secrets = Google::APIClient::ClientSecrets.load
        # The InstalledAppFlow is a helper class to handle the OAuth 2.0 installed
        # application flow, which ties in with FileStorage to store credentials
        # between runs.
        flow = Google::APIClient::InstalledAppFlow.new(
          :client_id => client_secrets.client_id,
          :client_secret => client_secrets.client_secret,
          :scope => ['https://www.googleapis.com/auth/drive', 
            'https://spreadsheets.google.com/feeds',
          'https://docs.google.com/feeds/']
        )
        client.authorization = flow.authorize(file_storage)
      else
        client.authorization = file_storage.authorization
      end
      GoogleDrive.login_with_oauth(client.authorization.access_token)
    end
    
    @session = self.setup
end