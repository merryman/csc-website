class AddAttachmentProfilePictureToVotingMembers < ActiveRecord::Migration
  def self.up
    change_table :voting_members do |t|
      t.attachment :profile_picture
    end
  end

  def self.down
    drop_attached_file :voting_members, :profile_picture
  end
end
