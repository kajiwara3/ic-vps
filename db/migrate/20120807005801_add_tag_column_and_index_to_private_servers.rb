class AddTagColumnAndIndexToPrivateServers < ActiveRecord::Migration
  def change
    add_column :private_servers, :tag, :string
    add_index :private_servers, :tag, length: 10
  end
end
