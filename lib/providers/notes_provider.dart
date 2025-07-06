import 'package:flutter/material.dart';
import '../models/note.dart';

class NotesProvider with ChangeNotifier {
  List<Note> _notes = [];
  bool isLoading = false;

  List<Note> get notes => _notes;

  Future<void> fetchNotes() async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 1));
    isLoading = false;
    notifyListeners();
  }

  void addNote(String content) {
    final note = Note(id: DateTime.now().toString(), content: content);
    _notes.add(note);
    notifyListeners();
  }

  void updateNote(String id, String newContent) {
    final index = _notes.indexWhere((note) => note.id == id);
    if (index != -1) {
      _notes[index] = Note(id: id, content: newContent);
      notifyListeners();
    }
  }

  void deleteNote(String id) {
    _notes.removeWhere((note) => note.id == id);
    notifyListeners();
  }
}
