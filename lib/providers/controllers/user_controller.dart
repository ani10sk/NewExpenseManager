import '../models/user.dart';
import '../services/user_service.dart';

class UserController {
  final UserService userService = UserService();
  Future<User> createUser(String name, String dob, String phoneNo) async {
    try {
      return await userService.createUser(name, phoneNo, dob);
    } catch (exception) {
      throw Exception(exception);
    }
  }

  User getUser(String name, String dob, String phoneNo) {
    try {
      return userService.getUser(name, phoneNo, dob);
    } catch (exception) {
      throw Exception(exception);
    }
  }
}
