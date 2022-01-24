import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_todo_bloc_8/model/task.dart';
import 'package:hive_todo_bloc_8/services/todo_service.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final TodoService _toDoService;

  TodosBloc(this._toDoService) : super(TodosInitial()) {
    on<LoadingTodosEvent>((event, emit) {
      final todos = _toDoService.getTasks(event.username);
      emit(TodosLoadingState(taskList: todos));
    });
  }
}
