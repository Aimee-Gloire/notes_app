import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/notes_provider.dart';
import '../widgets/note_card.dart';
import 'login_screen.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notesProvider = Provider.of<NotesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Notes'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));
            },
          )
        ],
      ),
      body: notesProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : notesProvider.notes.isEmpty
              ? Center(child: Text('Nothing here yet—tap ➕ to add a note.'))
              : ListView.builder(
                  itemCount: notesProvider.notes.length,
                  itemBuilder: (context, index) {
                    final note = notesProvider.notes[index];
                    return NoteCard(note: note);
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddNoteDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddNoteDialog(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final notesProvider = Provider.of<NotesProvider>(context, listen: false);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Note'),
        content: TextField(controller: controller, decoration: InputDecoration(hintText: 'Enter your note')),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              notesProvider.addNote(controller.text);
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}
