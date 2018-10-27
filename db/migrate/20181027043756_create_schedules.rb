class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.integer :user_id
      t.datetime :start
      t.string :title
      t.string :place

      t.timestamps
    end
  end
end
