class CreatePartnerOperationLogs < ActiveRecord::Migration
  def change
    create_table :partner_operation_logs do |t|
      t.references :partner
      t.text :url
      t.text :ip_address
      t.text :useragent
      t.text :request_method
      t.timestamps
    end
  end
end
