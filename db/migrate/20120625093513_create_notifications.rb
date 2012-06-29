class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.text :title, null: false
      t.text :body, null: false
      t.date :released_at
      t.date :expired_at
      t.timestamps
    end
  end
end
