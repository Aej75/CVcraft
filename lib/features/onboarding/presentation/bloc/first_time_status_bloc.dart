import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'first_time_status_event.dart';
part 'first_time_status_state.dart';

class FirstTimeStatusBloc
    extends Bloc<FirstTimeStatusEvent, FirstTimeStatusState> {
  FirstTimeStatusBloc() : super(FirstTimeStatusInitial()) {
    on<FirstTimeCheck>((event, emit) async {
      LoadingAnimationWidget.discreteCircle(
          color: const Color.fromARGB(15, 255, 3, 3), size: 2);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? firstTime = prefs.getBool('first_time');
      if (firstTime == null) {
        prefs.setBool('first_time', false);

        emit(FirstTimeStatusTrue(true));
      } else {
        emit(FirstTimeStatusFalse(false));
      }
    });
  }
}
