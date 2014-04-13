class ChangeEmailAdddressesToContacts < ActiveRecord::Migration
  def change
  	EmailAddress.destroy_all
  	remove_column :email_addresses, :person_id
  	add_column :email_addresses, :contact_id, :integer
  	add_column :email_addresses, :contact_type, :string
  end
end
