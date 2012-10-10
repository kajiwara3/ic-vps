class DropAdminFaqCategoriesTable < ActiveRecord::Migration
  def up
    drop_table :admin_faq_categories
  end
end
