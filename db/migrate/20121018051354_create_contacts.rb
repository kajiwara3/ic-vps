class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :partner, null: false
      t.text :subject
      t.text :body
      t.references :contact_status, default: 1
      t.text :memo
      t.timestamps
    end
  end
end
