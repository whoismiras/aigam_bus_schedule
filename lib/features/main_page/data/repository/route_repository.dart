import 'package:bus_schedule/core/config/core_network.dart';
import 'package:bus_schedule/core/network/api_service.dart';
import 'package:bus_schedule/di/di_locator.dart';
import 'package:bus_schedule/features/main_page/data/model/route_info_dto.dart';

/// route repository для получения данных
class RouteRepository {
  RouteRepository() : _apiService = sl();

  final ApiService _apiService;

  Future<TripsDto> getTariffInfo(
    String departure,
    String destination,
    String date,
  ) async {
    return safeApiCall<TripsDto>(
      _apiService.getRouteInfo(departure, destination, date),
      TripsDto.fromJson,
    );
  }
}
