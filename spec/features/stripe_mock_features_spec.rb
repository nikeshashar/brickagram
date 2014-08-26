require 'stripe_mock'

describe Brickagram do
	before { StripeMock.start }
	after { StripeMock.stop }

	it "creates a stripe customer" do

		# This doesn't touch stripe's servers nor the internet!
		customer = Stripe::Customer.create({
		  email: 'johnny@appleseed.com',
		  card: 'void_card_token'
		})
		expect(customer.email).to eq('johnny@appleseed.com')
	end

	it "mocks a declined card error" do
		# Prepares an error for the next create charge request
		StripeMock.prepare_card_error(:card_declined)

		expect { Stripe::Charge.create }.to raise_error {|e|
		expect(e).to be_a Stripe::CardError
		expect(e.http_status).to eq(402)
		expect(e.code).to eq('card_declined')
		}
	end
end

