import 'package:bus_schedule/core/widgets/app_loader_widget.dart';
import 'package:bus_schedule/features/authorization/presentation/authorization_screen.dart';
import 'package:bus_schedule/features/launch_page/presentation/cubit/launch__cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// splash screen for loading data
class LaunchPage extends StatelessWidget {
  const LaunchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LaunchCubit>(
      create: (context) => LaunchCubit()..getAppData(),
      child: BlocListener<LaunchCubit, LaunchPageSuccessState>(
        listener: (context, state) {
          if (state is LaunchPageSuccessState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const AuthorizationScreen(),
              ),
            );
          }
        },
        child: Container(
          color: Colors.green,
          child: const AppProgressIndicatorWidget(),
        ),
      ),
    );
  }
}
