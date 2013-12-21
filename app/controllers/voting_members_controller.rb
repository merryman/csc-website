class VotingMembersController < ApplicationController
  
  def index
    @members = VotingMember.all
    render 'index'
  end
  
end
