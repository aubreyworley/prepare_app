class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.string :first_name
      t.string :last_name
      t.string :status
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
