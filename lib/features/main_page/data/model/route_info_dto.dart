class TripsDto {
  TripsDto({
    this.trips,
  });

  TripsDto.fromJson(Map<String, dynamic> json) {
    if (json['trips'] != null) {
      trips = <RouteInfoDto>[];
      for (final value in json['trips'] as List<dynamic>? ?? <dynamic>[]) {
        trips?.add(
          RouteInfoDto.fromJson(value as Map<String, dynamic>),
        );
      }
    }
  }

  List<RouteInfoDto>? trips;
}

/// информация по отправлению
class RouteInfoDto {
  RouteInfoDto({
    this.bus,
    this.driver,
    this.departure,
    this.departureTime,
    this.destination,
    this.arrivalTime,
    this.cost,
  });

  factory RouteInfoDto.fromJson(Map<String, dynamic> json) => RouteInfoDto(
        bus: BusInfoDto.fromJson(json['Bus'] as Map<String, dynamic>),
        driver: json['Driver1'] as String?,
        departure: DepartureDto.fromJson(json['Departure'] as Map<String, dynamic>),
        departureTime: json['DepartureTime'] as String?,
        arrivalTime: json['ArrivalTime'] as String?,
        cost: json['PassengerFareCost'] as String?,
      );

  static List<RouteInfoDto> fromJsonList(List<dynamic>? jsonList) {
    final valueList = jsonList?.map(
      (dynamic json) => RouteInfoDto.fromJson(json as Map<String, dynamic>),
    );
    return valueList?.toList() ?? [];
  }

  final BusInfoDto? bus;
  final String? driver;
  final DepartureDto? departure;
  final String? departureTime;
  final DestinationDto? destination;
  final String? arrivalTime;
  final String? cost;
}

/// информация по автобусу
class BusInfoDto {
  BusInfoDto({
    this.model,
    this.licencePlate,
    this.baggageCapacity,
  });

  factory BusInfoDto.fromJson(Map<String, dynamic> json) => BusInfoDto(
        model: json['Model'] as String?,
        licencePlate: json['LicencePlate'] as String?,
        baggageCapacity: json['BaggageCapacity'] as int?,
      );

  final String? model;
  final String? licencePlate;
  final int? baggageCapacity;
}

/// информация по отправлению
class DepartureDto {
  DepartureDto({
    this.name,
  });

  factory DepartureDto.fromJson(Map<String, dynamic> json) => DepartureDto(
        name: json['Name'] as String?,
      );

  final String? name;
}

/// информация по прибытию
class DestinationDto {
  DestinationDto({
    this.name,
  });

  factory DestinationDto.fromJson(Map<String, dynamic> json) => DestinationDto(
        name: json['Name'] as String?,
      );

  final String? name;
}
