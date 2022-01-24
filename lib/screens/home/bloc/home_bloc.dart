import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_todo_bloc_8/services/authentication_service.dart';
import 'package:hive_todo_bloc_8/services/todo_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthenticationService _authenticationService;
  final TodoService _todoService;

  HomeBloc(this._authenticationService, this._todoService) : super(RegistrationServiceState()) {
    on<LoginEvent>((event, emit) async {
      final user = await _authenticationService.authenticateUser(event.username, event.password);

      if (user != null) {
        emit(SuccessfulLoginState(username: user));
        emit(const HomeInitial());
      }
    });

    on<RegisterServiceEvent>((event, emit) async {
      await _authenticationService.init();
      await _todoService.init();

      emit(const HomeInitial());
    });
  }
}
