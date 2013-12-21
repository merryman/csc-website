# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
Paperclip.options[:command_path] = "/usr/local/bin/"
run Rails.application
