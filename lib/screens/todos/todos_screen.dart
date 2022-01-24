import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_todo_bloc_8/screens/todos/bloc/todos_bloc.dart';
import 'package:hive_todo_bloc_8/services/todo_service.dart';

class TodosScreen extends StatelessWidget {
  final String username;
  const TodosScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: BlocProvider(
        create: (context) => TodosBloc(RepositoryProvider.of<TodoService>(context))..add(LoadingTodosEvent(username: username)),
        child: BlocBuilder<TodosBloc, TodosState>(
          builder: (context, state) {
            if (state is TodosLoadingState) {
              return ListView(
                children: state.taskList
                    .map((task) => ListTile(
                          title: Text(task.task),
                          trailing: Checkbox(
                            value: task.completed,
                            onChanged: (bool? value) {},
                          ),
                        ))
                    .toList(),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
