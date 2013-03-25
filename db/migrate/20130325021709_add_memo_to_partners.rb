class AddMemoToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :memo, :string
  end
end
