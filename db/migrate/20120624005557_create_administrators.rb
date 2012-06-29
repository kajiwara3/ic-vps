class CreateAdministrators < ActiveRecord::Migration
  def change
    create_table :administrators do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :hashed_password, null: false
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
