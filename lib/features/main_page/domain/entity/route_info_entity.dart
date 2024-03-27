import 'package:bus_schedule/core/const/core_constants.dart';
import 'package:bus_schedule/features/main_page/data/model/route_info_dto.dart';

class TripsEntity {
  TripsEntity({
    required this.trips,
  });
  factory TripsEntity.fromDto(TripsDto dto) => TripsEntity(
        trips: RouteInfoEntity.fromDtoList(dto.trips ?? []),
      );

  final List<RouteInfoEntity> trips;
}

class RouteInfoEntity {
  RouteInfoEntity({
    required this.bus,
    required this.driver,
    required this.departure,
    required this.departureTime,
    required this.destination,
    required this.arrivalTime,
    required this.cost,
  });

  factory RouteInfoEntity.fromDTO(RouteInfoDto dto) => RouteInfoEntity(
        bus: BusInfoEntity.fromDTO(dto.bus),
        driver: dto.driver ?? CoreConstants.empty,
        departure: DepartureEntity.fromDTO(dto.departure),
        departureTime: dto.departureTime ?? CoreConstants.empty,
        destination: DestinationEntity.fromDTO(dto.destination),
        arrivalTime: dto.arrivalTime ?? CoreConstants.empty,
        cost: dto.cost ?? CoreConstants.empty,
      );

  static List<RouteInfoEntity> fromDtoList(List<RouteInfoDto> dtoList) {
    return dtoList.map(RouteInfoEntity.fromDTO).toList();
  }

  final BusInfoEntity? bus;
  final String driver;
  final DepartureEntity? departure;
  final String departureTime;
  final DestinationEntity? destination;
  final String arrivalTime;
  final String cost;
}

/// информация по автобусу
class BusInfoEntity {
  BusInfoEntity({
    required this.model,
    required this.licencePlate,
    required this.baggageCapacity,
  });

  factory BusInfoEntity.fromDTO(BusInfoDto? dto) => BusInfoEntity(
        model: dto?.model ?? CoreConstants.empty,
        licencePlate: dto?.licencePlate ?? CoreConstants.empty,
        baggageCapacity: dto?.baggageCapacity ?? CoreConstants.zeroInt,
      );

  final String model;
  final String licencePlate;
  final int baggageCapacity;
}

/// информация по отправлению
class DepartureEntity {
  DepartureEntity({
    required this.name,
  });

  factory DepartureEntity.fromDTO(DepartureDto? dto) => DepartureEntity(
        name: dto?.name ?? CoreConstants.empty,
      );

  final String name;
}

/// информация по прибытию
class DestinationEntity {
  DestinationEntity({
    required this.name,
  });

  factory DestinationEntity.fromDTO(DestinationDto? dto) => DestinationEntity(
        name: dto?.name ?? CoreConstants.empty,
      );

  final String name;
}
