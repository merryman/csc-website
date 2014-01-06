require 'google_drive/voting_member'

class VotingMembersController < ApplicationController
  
  def index
    @voting_members = CouncilMemberGoogle.voting_members
    @staff_members = CouncilMemberGoogle.staff_members
    @community_members = CouncilMemberGoogle.community_members
    render :index
  end
  
end
