import 'package:bus_schedule/core/config/theme.dart';
import 'package:bus_schedule/core/const/core_constants.dart';
import 'package:bus_schedule/core/widgets/app_loader_widget.dart';
import 'package:bus_schedule/core/widgets/app_outline_button_widget.dart';
import 'package:bus_schedule/features/main_page/domain/use_case/route_use_case.dart';
import 'package:bus_schedule/features/main_page/presentation/cubit/route_cubit.dart';
import 'package:bus_schedule/features/main_page/presentation/ui/widgets/bus_card.dart';
import 'package:bus_schedule/features/main_page/presentation/ui/widgets/search_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RouteCubit(),
      child: BlocBuilder<RouteCubit, RouteCommonState>(
        builder: (context, state) {
          if (state.isLoading) {
            return Container(
              color: AppColors.pink,
              child: const AppProgressIndicatorWidget(),
            );
          }
          if (state is RouteSuccessState) {
            return Scaffold(
              body: ListView.builder(
                itemCount: state.data?.trips.length ?? 2,
                itemBuilder: (context, index) {
                  final item = state.data?.trips.elementAt(index);
                  return BusCardWidget(
                    driverName: item?.driver ?? CoreConstants.empty,
                    car: item?.bus?.model ?? CoreConstants.empty,
                    carPlateNumber: item?.bus?.licencePlate ?? CoreConstants.empty,
                    from: item?.departure?.name ?? CoreConstants.empty,
                    to: item?.destination?.name ?? CoreConstants.empty,
                    price: item?.cost ?? CoreConstants.empty,
                  );
                },
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(),
            bottomSheet: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: AppOutlineButtonWidget(
                text: 'Найти',
                onPressed: () {
                  context.read<RouteCubit>().getBusRoutes();
                },
              ),
            ),
            body: const Column(
              children: [
                Text(
                  'Поиск поездок',
                  style: TextStyle(fontSize: 25),
                ),
                SearchWidget(),
              ],
            ),
          );
        },
      ),
    );
  }
}
