part of 'route_cubit.dart';

class RouteCommonState extends Equatable {
  const RouteCommonState({
    this.departure = CoreConstants.empty,
    this.arrival = CoreConstants.empty,
    this.date = CoreConstants.empty,
    this.isLoading = false,
  });

  final String departure;
  final String arrival;
  final String date;
  final bool isLoading;

  RouteCommonState copyWith({
    String? departure,
    String? arrival,
    String? date,
    bool? isLoading,
  }) {
    return RouteCommonState(
      departure: departure ?? this.departure,
      arrival: arrival ?? this.arrival,
      date: date ?? this.date,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
        departure,
        arrival,
        date,
        isLoading,
      ];
}

class RouteSuccessState extends RouteCommonState {
  const RouteSuccessState({
    this.data,
  });

  final TripsEntity? data;
}
