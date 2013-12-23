require 'google_drive/voting_member'

class VotingMembersController < ApplicationController
  
  @voting_members = VotingMemberGoogle.fetchAll
  
  def index
    render :index
  end
  
end
