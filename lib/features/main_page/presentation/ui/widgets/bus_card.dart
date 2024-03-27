import 'package:bus_schedule/core/config/theme.dart';
import 'package:flutter/material.dart';

/// карточка автобуса
class BusCardWidget extends StatelessWidget {
  const BusCardWidget({
    super.key,
    required this.driverName,
    required this.car,
    required this.carPlateNumber,
    required this.from,
    required this.to,
    required this.price,
  });

  final String driverName;
  final String car;
  final String carPlateNumber;
  final String from;
  final String to;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: AppColors.commonYellow)),
      child: Column(
        children: [
          Text(driverName),
          Text(car),
          Text(carPlateNumber),
          Text(from),
          Text(to),
          Text(price),
        ],
      ),
    );
  }
}
