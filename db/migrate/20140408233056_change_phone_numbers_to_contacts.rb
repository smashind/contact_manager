class ChangePhoneNumbersToContacts < ActiveRecord::Migration
  def change
  	PhoneNumber.destroy_all
  	remove_column :phone_numbers, :person_id
  	add_column :phone_numbers, :contact_id, :integer
  	add_column :phone_numbers, :contact_type, :string
  end
end
