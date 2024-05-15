class ApiNewsConfig {
  final String apiKey = 'cc845fb8f8f849699b160703aa0b5c53';
  final String searchNewsCurl = 'https://newsapi.org/v2/everything';
  final String newsCurl = 'https://newsapi.org/v2/top-headlines';
}

class GeocoderApiConfig {
  final String apiKey = 'a3b355c0e0d44ef5a5587f62ab0dcc25';
  final String reverseGeocodingCurl =
      'https://api.opencagedata.com/geocode/v1/json';
}

class WeatherApiConfig {
  final String apiKey = '2d92e6160501400b923123326230511';
  final String weatherCurl = 'http://api.weatherapi.com/v1/current.json';
}

class CountryApiConfig {
  static const String countryListCurl = 'https://restcountries.com/v3.1/all';
}
