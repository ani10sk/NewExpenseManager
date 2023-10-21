import 'package:intl/intl.dart';
import './user.dart';

class UserBuilder {
  String name = "";
  String dateOfBirth = "";
  String phoneNumber = "";

  UserBuilder getName(String name) {
    this.name = name;
    return this;
  }

  UserBuilder getDOB(String dateOfBirth) {
    this.dateOfBirth = dateOfBirth;
    return this;
  }

  UserBuilder getPhoneNo(String phoneNumber) {
    this.phoneNumber = phoneNumber;
    return this;
  }

  User build() {
    DateTime dOB = DateFormat("dd-MM-yy").parse(dateOfBirth);
    DateTime current = DateTime.now();
    if (dOB.isAfter(current)) {
      throw Exception("The date of birth of the person cannot be in future");
    }
    return User(name, dateOfBirth, phoneNumber, [], [], []);
  }
}
