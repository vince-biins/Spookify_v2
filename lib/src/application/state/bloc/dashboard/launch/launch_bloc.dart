import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'launch_event.dart';

part 'launch_bloc.freezed.dart';

class LaunchBloc extends Bloc<LaunchEvent, int> {
  LaunchBloc() : super(0) {
    on<LaunchEvent>((event, emit) {
      print('LAUNCHBLOC ${event.index}');
      emit(event.index);
    });
  }
}
