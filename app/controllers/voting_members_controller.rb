class VotingMembersController < ApplicationController
  
  def index
    render :index
  end

  def create
    @member = VotingMember.new(post_params)
    if @member.save
      flash[:notice] = "Saved successfully"
      redirect_to :controller => 'voting_members'
    else
      flash[:notice] = "Something Went Wrong here"
      redirect_to :controller => 'voting_members'
    end
  end

  def update
  end

  def destroy
    @member = VotingMember.find(params[:id])
    @member.destroy
 
    redirect_to :controller => 'voting_members'
  end
  
  private
    def post_params
      params.require(:member).permit(:first_name, 
                                     :last_name, 
                                     :description, 
                                     :profile_picture)
    end
  
end
