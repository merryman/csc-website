class VotingMembers < ActiveRecord::Migration
  def self.up
   change_column :voting_members, :description, :text
  end

  def self.down
   change_column :voting_members, :description, :string
  end
end
