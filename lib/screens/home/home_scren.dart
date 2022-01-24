import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_todo_bloc_8/screens/home/bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  const HomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocProvider(
        create: (context) => HomeBloc(),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeInitial) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Username',
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Login'),
                      )
                    ],
                  ),
                ),
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
