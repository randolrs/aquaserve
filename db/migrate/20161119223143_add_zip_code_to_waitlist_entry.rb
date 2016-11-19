class AddZipCodeToWaitlistEntry < ActiveRecord::Migration
  def change
    add_column :waitlist_entries, :zip_code, :string
  end
end
