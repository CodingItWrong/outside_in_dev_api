# frozen_string_literal: true

require "rails_helper"

RSpec.describe "ClientApps", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "allows creating a client app" do
    api_key = "ABC123"

    allow(SecureRandom).to receive(:alphanumeric)
      .with(32)
      .and_return(api_key)

    visit "/"
    click_on "Create API Key"

    expect(page).to have_selector(".api-key")
    expect(page).to have_selector(".api-key[value=#{api_key}]")

    expect(ClientApp.count).to eql(1)

    app = ClientApp.first
    expect(app.apiKey).to eql(api_key)
    expect(app.restaurants.count).to eql(2)
  end
end
