part of 'first_time_status_bloc.dart';

@immutable
abstract class FirstTimeStatusState {}

class FirstTimeStatusInitial extends FirstTimeStatusState {}

class FirstTimeStatusCheck extends FirstTimeStatusState {}

class FirstTimeStatusTrue extends FirstTimeStatusState {
  final bool checkFirstTime;

  FirstTimeStatusTrue(this.checkFirstTime);
}

class FirstTimeStatusFalse extends FirstTimeStatusState {
  final bool checkFirstTime;

  FirstTimeStatusFalse(this.checkFirstTime);
}
