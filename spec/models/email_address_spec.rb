require 'spec_helper'

describe EmailAddress do
  let(:email_address) {	EmailAddress.new(address: "testemail@testing.com", contact_id: 1, contact_type: "Person") }

  it 'is valid' do
  	expect(email_address).to be_valid
  end

  it 'is invalid without an address' do
  	email_address.address = nil
  	expect(email_address).to_not be_valid
  end

  it 'is invalid without a person id' do
  	email_address.contact_id = nil
  	expect(email_address).to_not be_valid
  end

  it 'is associated with a person' do 
    expect(email_address).to respond_to(:contact)
  end
end
