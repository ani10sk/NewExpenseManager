import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import '../models/user_builder.dart';

class UserService {
  Future<User> createUser(String name, String phoneNo, String dob) async {
    try {
      UserBuilder builder = User.getBuilder();
      User user = builder.getDOB(dob).getName(name).getPhoneNo(phoneNo).build();
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setBool("registered", true);
      return user;
    } catch (exception) {
      throw Exception(e);
    }
  }
}
