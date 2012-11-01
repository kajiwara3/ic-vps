class CreateContactStatuses < ActiveRecord::Migration
  def change
    create_table :contact_statuses do |t|
      t.text :name
      t.integer :contact_status_code
      t.timestamps
    end
  end
end
