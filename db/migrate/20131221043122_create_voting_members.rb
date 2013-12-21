class CreateVotingMembers < ActiveRecord::Migration
  def change
    create_table :voting_members do |t|
      t.string :first_name
      t.string :last_name
      t.string :description

      t.timestamps
    end
  end
end
