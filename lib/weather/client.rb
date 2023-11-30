require 'rest-client'
require 'json'

module Weather
  class Client
    def initialize(api_key)
      @api_key = api_key
    end

    def get_weather(city)
      url = "https://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{@api_key}"
      response = RestClient.get(url)
      data = JSON.parse(response.body)
      parse_weather_data(data)
    end

    private

    def parse_weather_data(data)
      p data
      {
        temperature: data['main']['temp'],
        description: data['weather'][0]['description'],
        humidity: data['main']['humidity']
      }
    end
  end
end
