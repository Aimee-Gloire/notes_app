import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/note.dart';

class NotesService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Note>> fetchNotes(String userId) async {
    final snapshot = await _firestore.collection('users').doc(userId).collection('notes').get();
    return snapshot.docs
        .map((doc) => Note(id: doc.id, content: doc['content'] ?? ''))
        .toList();
  }

  Future<void> addNote(String userId, String content) async {
    await _firestore.collection('users').doc(userId).collection('notes').add({'content': content});
  }

  Future<void> updateNote(String userId, String noteId, String newContent) async {
    await _firestore.collection('users').doc(userId).collection('notes').doc(noteId).update({'content': newContent});
  }

  Future<void> deleteNote(String userId, String noteId) async {
    await _firestore.collection('users').doc(userId).collection('notes').doc(noteId).delete();
  }
}
