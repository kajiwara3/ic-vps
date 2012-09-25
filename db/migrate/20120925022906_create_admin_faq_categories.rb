class CreateAdminFaqCategories < ActiveRecord::Migration
  def change
    create_table :admin_faq_categories do |t|
      t.text :name

      t.timestamps
    end
  end
end
