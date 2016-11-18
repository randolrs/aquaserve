class AddServicesToServicesRequests < ActiveRecord::Migration
  def change
    add_column :service_requests, :setup, :boolean
    add_column :service_requests, :cleaning, :boolean
    add_column :service_requests, :design, :boolean
    add_column :service_requests, :relocation, :boolean
  end
end
