import 'package:hive/hive.dart';
import 'package:hive_todo_bloc_8/model/user.dart';

class AuthenticationService {
  late Box<User> _users;

  Future<void> init() async {
    Hive.registerAdapter(UserAdapter());
    _users = await Hive.openBox('usersBox');
  }

  Future<String?> authenticateUser(final String username, final String password) async {
    final success = _users.values.any((element) => element.username == username && element.password == password);

    if (success) {
      return username;
    } else {
      return null;
    }
  }
}
