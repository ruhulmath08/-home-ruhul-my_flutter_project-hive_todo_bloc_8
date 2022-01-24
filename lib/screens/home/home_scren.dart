import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_todo_bloc_8/screens/home/bloc/home_bloc.dart';
import 'package:hive_todo_bloc_8/screens/todos/todos_screen.dart';
import 'package:hive_todo_bloc_8/services/authentication_service.dart';
import 'package:hive_todo_bloc_8/services/todo_service.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  HomeScreen({Key? key, required this.title}) : super(key: key);

  final usernameText = TextEditingController();
  final passwordText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocProvider(
        create: (context) => HomeBloc(
          RepositoryProvider.of<AuthenticationService>(context),
          RepositoryProvider.of<TodoService>(context),
        )..add(RegisterServiceEvent()),
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is SuccessfulLoginState) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TodosScreen(username: state.username),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is HomeInitial) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: usernameText,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: passwordText,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () => BlocProvider.of<HomeBloc>(context).add(LoginEvent(username: usernameText.text, password: passwordText.text)),
                        child: const Text('Login'),
                      )
                    ],
                  ),
                ),
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
