class AddPrivateServerCodeToPrivateServers < ActiveRecord::Migration
  def change
    add_column :private_servers, :private_server_code, :string, null: false
    add_index :private_servers, :private_server_code, length: 10
  end
end
