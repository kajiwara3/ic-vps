class CreateFaqCategories < ActiveRecord::Migration
  def change
    create_table :faq_categories do |t|
      t.text :name
      t.timestamps
    end
  end
end
