import 'package:bus_schedule/core/config/core_network.dart';
import 'package:dio/dio.dart';

/// network service
class ApiService {
  final _httpClient = createHttpClient('https://bibiptrip.com/api');

  /// request to get bus route information
  Future<Response> getRouteInfo(
    String departure,
    String destination,
    String date,
  ) async {
    final client = await _httpClient;
    return client.get<dynamic>(
      '/avibus/search_trips_cities/',
      queryParameters: <String, dynamic>{
        'departure_city': departure,
        'destination_city': destination,
        'date': date,
      },
    );
  }
}
