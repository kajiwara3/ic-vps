class CreateDomainTemplates < ActiveRecord::Migration
  def change
    create_table :domain_templates do |t|
      t.string :name, null: false
      t.text :xml_data, null: false
      t.timestamps
    end
  end
end
