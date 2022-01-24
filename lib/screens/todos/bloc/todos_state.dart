part of 'todos_bloc.dart';

abstract class TodosState extends Equatable {
  const TodosState();
}

class TodosInitial extends TodosState {
  @override
  List<Object> get props => [];
}

class TodosLoadingState extends TodosState {
  final List<Task> taskList;

  const TodosLoadingState({required this.taskList});

  @override
  List<Object?> get props => [taskList];
}
