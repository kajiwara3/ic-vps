class ModifyFaqs < ActiveRecord::Migration
  def change
    change_table :faqs do |t|
      t.remove :admin_faq_category_id
      t.references :faq_category
    end
    add_index :faqs, :faq_category_id
  end
end