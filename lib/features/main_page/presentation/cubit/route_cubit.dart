import 'package:bloc/bloc.dart';
import 'package:bus_schedule/core/const/core_constants.dart';
import 'package:bus_schedule/di/di_locator.dart';
import 'package:bus_schedule/features/main_page/domain/entity/route_info_entity.dart';
import 'package:bus_schedule/features/main_page/domain/use_case/route_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

part 'route_state.dart';

class RouteCubit extends Cubit<RouteCommonState> {
  RouteCubit()
      : _getTariffInfo = sl(),
        super(const RouteCommonState());

  final GetRouteUseCase _getTariffInfo;

  /// поиск роутов
  Future<void> getBusRoutes() async {
    final state = _getCommonState();
    emit(state.copyWith(isLoading: true));

    final request = await _getTariffInfo.execute(
      RouteParams(
        departure: state.departure,
        destination: state.arrival,
        date: state.date,
      ),
    );

    emit(state.copyWith(isLoading: false));
    emit(RouteSuccessState(data: request));
  }

  /// ввод откуда
  void enterDeparture(String value) {
    final state = _getCommonState();
    emit(
      state.copyWith(
        departure: value,
      ),
    );
  }

  /// ввод куда
  void enterArrival(String value) {
    final state = _getCommonState();
    emit(
      state.copyWith(
        arrival: value,
      ),
    );
  }

  /// ввод даты
  void enterDate(DateTime newDateTime) {
    final state = _getCommonState();
    final value = DateFormat('yyyy-MM-dd').format(newDateTime);
    emit(
      state.copyWith(
        date: value,
      ),
    );
  }

  RouteCommonState _getCommonState() {
    if (state is RouteCommonState) {
      return state as RouteCommonState;
    }

    return const RouteCommonState(
      departure: '',
      arrival: '',
      date: '',
    );
  }
}
