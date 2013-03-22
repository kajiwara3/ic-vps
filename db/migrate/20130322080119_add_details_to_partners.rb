class AddDetailsToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :phone_number1, :string
    add_column :partners, :phone_number2, :string
    add_column :partners, :fax_number, :string
  end
end
