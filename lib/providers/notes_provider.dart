import 'package:flutter/material.dart';
import '../models/note.dart';
import '../services/notes_service.dart';
import '../services/auth_service.dart';

class NotesProvider with ChangeNotifier {
  final NotesService _notesService = NotesService();
  final AuthService _authService = AuthService();

  List<Note> _notes = [];
  bool isLoading = false;

  List<Note> get notes => _notes;

  Future<void> fetchNotes() async {
    isLoading = true;
    notifyListeners();

    final userId = _authService.currentUser?.uid;
    if (userId != null) {
      _notes = await _notesService.fetchNotes(userId);
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> addNote(String content) async {
    final userId = _authService.currentUser?.uid;
    if (userId != null) {
      await _notesService.addNote(userId, content);
      await fetchNotes();
    }
  }

  Future<void> updateNote(String id, String newContent) async {
    final userId = _authService.currentUser?.uid;
    if (userId != null) {
      await _notesService.updateNote(userId, id, newContent);
      await fetchNotes();
    }
  }

  Future<void> deleteNote(String id) async {
    final userId = _authService.currentUser?.uid;
    if (userId != null) {
      await _notesService.deleteNote(userId, id);
      await fetchNotes();
    }
  }
}
