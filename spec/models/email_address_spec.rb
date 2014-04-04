require 'spec_helper'

describe EmailAddress do
  let(:email_address) do
  	EmailAddress.new(address: "testemail@testing.com")
  end

  it 'is valid' do
  	expect(email_address).to be_valid
  end

  it 'is invalid without an address' do
  	email_address.address = nil
  	expect(email_address).to_not be_valid
  end

end
