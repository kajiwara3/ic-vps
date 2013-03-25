class ChangeTypeInPartners < ActiveRecord::Migration
  def up
    change_column :partners, :memo, :longtext
  end

  def down
    change_column :partners, :memo, :text
  end
end
