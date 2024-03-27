import 'package:bus_schedule/core/config/theme.dart';
import 'package:bus_schedule/features/main_page/presentation/cubit/route_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.pink),
          ),
          child: TextField(
            onChanged: (text) => context.read<RouteCubit>().enterDeparture(text),
            controller: TextEditingController(),
            decoration: const InputDecoration(
              isDense: true,
              prefixIcon: Icon(Icons.search_rounded),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              prefixIconConstraints: BoxConstraints(
                maxWidth: 40,
              ),
              hintText: ' Откуда',
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
            keyboardType: TextInputType.text,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.pink),
          ),
          child: TextField(
            onChanged: (text) => context.read<RouteCubit>().enterArrival(text),
            controller: TextEditingController(),
            decoration: const InputDecoration(
              isDense: true,
              prefixIcon: Icon(Icons.search_rounded),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              prefixIconConstraints: BoxConstraints(
                maxWidth: 40,
              ),
              hintText: ' Куда',
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
            keyboardType: TextInputType.text,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          height: 100,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: CupertinoDatePicker(
            initialDateTime: DateTime.utc(2024, 1, 1),
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (newDateTime) => context.read<RouteCubit>().enterDate(newDateTime),
          ),
        ),
      ],
    );
  }
}
