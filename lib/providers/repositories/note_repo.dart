import 'package:flutter/material.dart';
import '../models/note.dart';

class NoteRepo extends ChangeNotifier {
  List<Note> notes = [];
}
