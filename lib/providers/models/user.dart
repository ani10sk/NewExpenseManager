import './user_builder.dart';
import './benefactor.dart';
import './category.dart';
import './note.dart';

class User {
  final String name;
  final String dateOfBirth;
  final String phoneNumber;
  final List<Benefactor> benefactors;
  final List<Category> categories;
  final List<Note> notes;

  User(this.name, this.dateOfBirth, this.phoneNumber, this.benefactors,
      this.categories, this.notes);

  static UserBuilder getBuilder() {
    return UserBuilder();
  }
}
