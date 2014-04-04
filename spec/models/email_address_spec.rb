require 'spec_helper'

describe EmailAddress do
  let(:email_address) do
  	EmailAddress.new(address: "testemail@testing.com", person_id: 1)
  end

  it 'is valid' do
  	expect(email_address).to be_valid
  end

  it 'is invalid without an address' do
  	email_address.address = nil
  	expect(email_address).to_not be_valid
  end

  it 'is invalid without a person id' do
  	email_address.person_id = nil
  	expect(email_address).to_not be_valid
  end

end
