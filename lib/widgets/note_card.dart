import 'package:flutter/material.dart';
import '../models/note.dart';
import 'package:provider/provider.dart';
import '../providers/notes_provider.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  NoteCard({required this.note});

  @override
  Widget build(BuildContext context) {
    final notesProvider = Provider.of<NotesProvider>(context, listen: false);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        title: Text(note.content),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                _showEditDialog(context, note);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                notesProvider.deleteNote(note.id);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, Note note) {
    final TextEditingController controller = TextEditingController(text: note.content);
    final notesProvider = Provider.of<NotesProvider>(context, listen: false);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Note'),
        content: TextField(controller: controller),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              notesProvider.updateNote(note.id, controller.text);
              Navigator.pop(context);
            },
            child: Text('Update'),
          ),
        ],
      ),
    );
  }
}
