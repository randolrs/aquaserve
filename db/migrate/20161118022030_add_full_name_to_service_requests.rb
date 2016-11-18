class AddFullNameToServiceRequests < ActiveRecord::Migration
  def change
    add_column :service_requests, :full_name, :string
  end
end
