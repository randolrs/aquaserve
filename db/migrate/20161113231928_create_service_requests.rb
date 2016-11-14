class CreateServiceRequests < ActiveRecord::Migration
  def change
    create_table :service_requests do |t|
      t.string :email
      t.string :zip_code
      t.decimal :gallons_in_tank
      t.boolean :salt_water
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
