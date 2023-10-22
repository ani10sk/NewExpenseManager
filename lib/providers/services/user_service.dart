import 'dart:convert';
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
      String userJSON = jsonEncode(user.getUserMap());
      await preferences.setString("user", userJSON);
      return user;
    } catch (exception) {
      throw Exception(e);
    }
  }

  User getUser(String name, String phoneNo, String dob) {
    try {
      UserBuilder builder = User.getBuilder();
      return builder.getName(name).getPhoneNo(phoneNo).getDOB(dob).build();
    } catch (exception) {
      throw Exception(exception);
    }
  }
}
