class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.references :admin_faq_category, null:false
      t.string :question, null: false
      t.text :answer, null: false
      t.string :tag, null: true
      t.timestamps
    end
    add_index :faqs, :admin_faq_category_id
  end
end
