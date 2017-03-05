class CreateAttendance < ActiveRecord::Migration[5.0]
  def change
    create_table :attendances do |table|
      table.belongs_to :user, index: true
      table.belongs_to :meetup, index: true
    end
  end
end
