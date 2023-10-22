import './user_builder.dart';
import './benefactor.dart';
import './category.dart';
import './note.dart';

class User {
  final String _name;
  final String _dateOfBirth;
  final String _phoneNumber;
  final List<Benefactor> _benefactors;
  final List<Category> _categories;
  final List<Note> _notes;

  User(this._name, this._dateOfBirth, this._phoneNumber, this._benefactors,
      this._categories, this._notes);

  String getName() {
    return _name;
  }

  String getDOB() {
    return _dateOfBirth;
  }

  String getPhoneNo() {
    return _phoneNumber;
  }

  List<Benefactor> getBenefactors() {
    return _benefactors;
  }

  List<Category> getCategories() {
    return _categories;
  }

  List<Note> getNotes() {
    return _notes;
  }

  Map<String, String> getUserMap() {
    Map<String, String> data = {};
    data["name"] = _name;
    data["phoneNumber"] = _phoneNumber;
    data["dateOfBirth"] = _dateOfBirth;
    return data;
  }

  static UserBuilder getBuilder() {
    return UserBuilder();
  }
}
