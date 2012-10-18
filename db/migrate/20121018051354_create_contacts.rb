class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :partner, null: false
      t.text :subject
      t.text :body
      t.references :cantact_status
      t.text :memo
      t.timestamps
    end
  end
end
