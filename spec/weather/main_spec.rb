require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')
require 'json'
require 'logger'

describe Weather::Client do

  before do
    WebMock.enable!
    WebMock.reset!
  end

  describe '#fetch_weather' do

    let(:data) do
      {
        id: '1234567',
        step: :checkout,
        date: "11/05/2022",
        loyalty_customer_card: '9500000000013',
        warehouse_id: 33,
        items: [
          {
            external_product_id: 2008,
            quantity: 1,
            price: 0.69
          }
        ],
        promotion_codes: [
        ]
      }
    end

    it 'performs basket_api with product data' do
      weather_response = '{
        "coord": { "lon": 24.9355, "lat": 60.1695},
        "weather": [
          {
            "id": 600,
            "main": "Snow",
            "description": "light snow",
            "icon": "13d"
          }
        ],
        "base": "stations",
        "main": {"temp": 269.58, "feels_like": 262.58, "temp_min": 268.49, "temp_max": 270.8, "pressure": 1003, "humidity": 88},
        "visibility": 4000,
        "wind": {"speed": 10.73, "deg": 30, "gust": 13.41},
        "snow": {"1h": 0.12},
        "clouds": {"all": 75},
        "dt": 1701346226
      }'
      stub_request(:get, %r{https://api.openweathermap.org/data/2.5/weather\?.*}).to_return(status: 200, body: weather_response, headers: {})

      resp = described_class.new('c49fd04a8bd351a92449xxxtx').fetch_weather('Helsinki')
      expect(resp).to eq(
        {
          temperature: 269.58,
          description: "light snow",
          humidity: 88
        }
      )
    end

  end

end
# rubocop:enable Metrics/BlockLength
