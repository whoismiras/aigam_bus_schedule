import 'package:bus_schedule/core/use_case/core_use_case.dart';
import 'package:bus_schedule/di/di_locator.dart';
import 'package:bus_schedule/features/main_page/data/repository/route_repository.dart';
import 'package:bus_schedule/features/main_page/domain/entity/route_info_entity.dart';

/// use case для информации по роутам
class GetRouteUseCase extends CoreFutureUseCase<RouteParams, TripsEntity> {
  GetRouteUseCase() : _repository = sl();

  final RouteRepository _repository;

  @override
  Future<TripsEntity> execute(param) async {
    final response = await _repository.getTariffInfo(
      param.departure,
      param.destination,
      param.date,
    );
    return TripsEntity.fromDto(response);
  }
}

class RouteParams {
  RouteParams({
    required this.departure,
    required this.destination,
    required this.date,
  });
  final String departure;
  final String destination;
  final String date;
}
