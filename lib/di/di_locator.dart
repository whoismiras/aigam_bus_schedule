import 'package:bus_schedule/core/network/api_service.dart';
import 'package:bus_schedule/features/main_page/data/repository/route_repository.dart';
import 'package:bus_schedule/features/main_page/domain/use_case/route_use_case.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initLocator() async {
  _apiServiceModule();
  _repositoryModule();
  _useCaseModule();
}

/// api зависимости
void _apiServiceModule() {
  sl.registerSingleton(ApiService());
}

/// для репозиторий
void _repositoryModule() {
  sl.registerFactory(RouteRepository.new);
}

/// для useCase
void _useCaseModule() {
  sl.registerFactory(GetRouteUseCase.new);
}
