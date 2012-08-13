class CreatePrivateServers < ActiveRecord::Migration
  def change
    create_table :private_servers do |t|
      t.references :partner, null:false
      t.string :name, null:false
      t.text :memo
      t.timestamps
    end
  end
end
