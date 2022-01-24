part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  final bool? isSuccess;

  const HomeInitial({this.isSuccess});

  @override
  List<Object?> get props => [isSuccess];
}
