class CreateStatusUpdates < ActiveRecord::Migration
  def change
    create_table :status_updates do |t|
      t.datetime :date
      t.string :content

      t.timestamps
    end
  end
end
