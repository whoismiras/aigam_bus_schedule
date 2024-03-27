import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'launch__state.dart';

class LaunchCubit extends Cubit<LaunchPageSuccessState> {
  LaunchCubit() : super(LaunchPageSuccessState());

  /// method to emulate loading
  void getAppData() {
    Future.delayed(
      const Duration(seconds: 2),
      () => emit(LaunchPageSuccessState()),
    );
  }
}
