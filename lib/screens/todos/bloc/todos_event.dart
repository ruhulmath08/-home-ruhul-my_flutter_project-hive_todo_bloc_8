part of 'todos_bloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();
}

class LoadingTodosEvent extends TodosEvent {
  final String username;

  const LoadingTodosEvent({required this.username});

  @override
  // TODO: implement props
  List<Object?> get props => [username];
}
