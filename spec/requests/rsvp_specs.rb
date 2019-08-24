require 'rails_helper'

RSpec.describe RsvpsController, type: :request do
  ENV['CSV_TOKEN'] = 'test'

  it 'can download a CSV' do
    3.times { create :rsvp }

    get '/rsvps.csv', params: { token: 'test' }

    csv = CSV.parse(response.body, headers: true)
    expect(csv.count).to eq 3
  end
end