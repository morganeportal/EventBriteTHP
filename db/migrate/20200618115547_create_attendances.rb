class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.string :strip_customer_id
      t.belongs_to :event, index:true
      t.belongs_to :participant, class_name:"User", index: true

      t.timestamps
    end
  end
end