class CreateTimeFrames < ActiveRecord::Migration
  def change
    create_table :time_frames do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
