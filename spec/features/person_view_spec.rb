require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'the person view', type: :feature do 

	let(:person) { Person.create(first_name: 'John', last_name: 'Doe') }

	describe 'phone numbers' do	
		before(:each) do
			person.phone_numbers.create(number: "555-1234")
			person.phone_numbers.create(number: "555-5678")
			visit person_path(person)
		end

		it 'shows the phone numbers' do
			person.phone_numbers.each do |phone|
				expect(page).to have_content(phone.number)
			end
		end

		it 'has a link to add a new phone number' do
			expect(page).to have_link('Add phone number', href: new_phone_number_path(contact_id:person.id, contact_type: "Person" ))
		end

		it 'adds a new phone number' do
			page.click_link('Add phone number')
			page.fill_in('Number', with: '555-8888')
			page.click_button('Create Phone number')
			expect(current_path).to eq(person_path(person))
			expect(page).to have_content('555-8888')
		end

		it 'has links to edit phone numbers' do
			person.phone_numbers.each do |phone|
				expect(page).to have_link('Edit Number', href: edit_phone_number_path(phone))
			end
		end

		it 'edits a phone number' do
			phone = person.phone_numbers.first
			old_number = phone.number

			first(:link, 'Edit Number').click
			page.fill_in('Number', with: '555-9191')
			page.click_button('Update Phone number')
			expect(current_path).to eq(person_path(person))
			expect(page).to have_content('555-9191')
			expect(page).to_not have_content(old_number)
		end

		it 'destroys a phone number' do
			phone = person.phone_numbers.first
			old_number = phone.number 

			first(:link, 'Delete Number').click
			# page.driver.browser.switch_to.alert.accept
			expect(current_path).to eq(person_path(person))
			expect(page).to_not have_content(old_number)
		end
    end

    describe 'email address' do
		before(:each) do
			person.email_addresses.create(address: "testaddress123@msn.com")
			person.email_addresses.create(address: "garae23sdz@yahoo.gov")
			visit person_path(person)
		end

		it 'shows the email addresses' do
			person.email_addresses.each do |email|
				expect(page).to have_selector('li', text: email.address)
			end
		end

		it 'has an add email address link' do
			expect(page).to have_link('Add email address', href: new_email_address_path(contact_id:person.id, contact_type: "Person" ))
		end

		it 'adds a new email address' do
			page.click_link('Add email address')
			page.fill_in('Address', with: 'hahaha1213@msn.guv')
			page.click_button('Create Email address')
			expect(current_path).to eq(person_path(person))
			expect(page).to have_content('hahaha1213@msn.guv')
		end

		it 'has links to edit email addresses' do
			person.email_addresses.each do |email|
				expect(page).to have_link('Edit Address', href: edit_email_address_path(email))
			end
		end

		it 'edits an email address' do
			email = person.email_addresses.first
			old_address = email.address

			first(:link, 'Edit Address').click
			page.fill_in('Address', with: 'test@test.guv')
			page.click_button('Update Email address')
			expect(current_path).to eq(person_path(person))
			expect(page).to have_content('test@test.guv')
			expect(page).to_not have_content(old_address)
		end

		it 'destroys an email address' do
			email = person.email_addresses.first
			old_address = email.address

			first(:link, 'Delete Address').click
			expect(current_path).to eq(person_path(person))
			expect(page).to_not have_content(old_address)
		end
	end

end