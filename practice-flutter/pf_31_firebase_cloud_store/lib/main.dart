import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; // Helper for date formatting

// ---------------------------------------------------------------------------
// MAIN ENTRY POINT
// ---------------------------------------------------------------------------
void main() async {
  // Ensure that Flutter bindings are initialized before calling native code
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  // IMPORTANT: You must have your google-services.json (Android)
  // or GoogleService-Info.plist (iOS) added to your project for this to work.
  // See README.md for step-by-step setup.
  await Firebase.initializeApp();

  runApp(const MyApp());
}

// ---------------------------------------------------------------------------
// ROOT WIDGET
// ---------------------------------------------------------------------------
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Firestore Demo',
      debugShowCheckedModeBanner: false,
      // Using Material 3 for a modern look
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const NotesPage(),
    );
  }
}

// ---------------------------------------------------------------------------
// MAIN SCREEN (CRUD OPERATIONS)
// ---------------------------------------------------------------------------
class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  // R - REFERENCE TO FIRESTORE COLLECTION
  // This acts as a handle to the 'notes' collection in your Firestore database.
  // If it doesn't exist, Firestore will create it automatically when data is added.
  final CollectionReference notesCollection = FirebaseFirestore.instance
      .collection('notes');

  // CONTROLLERS
  // Used to retrieve text from the input fields
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  // C - CREATE or U - UPDATE
  // This function opens a dialog to either add a new note or edit an existing one.
  // If [docId] is provided, it's an UPDATE operation.
  // If [docId] is null, it's a CREATE operation.
  Future<void> _showNoteDialog({
    String? docId,
    Map<String, dynamic>? currentData,
  }) async {
    // If editing, pre-fill the text fields
    if (docId != null && currentData != null) {
      _titleController.text = currentData['title'];
      _contentController.text = currentData['content'];
    } else {
      // If adding new, clear fields
      _titleController.clear();
      _contentController.clear();
    }

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(docId == null ? 'Add New Note' : 'Update Note'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _contentController,
                  decoration: const InputDecoration(
                    labelText: 'Content',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                final String title = _titleController.text.trim();
                final String content = _contentController.text.trim();

                if (title.isNotEmpty && content.isNotEmpty) {
                  if (docId == null) {
                    // CREATE: Add a new document
                    await notesCollection.add({
                      'title': title,
                      'content': content,
                      'timestamp':
                          FieldValue.serverTimestamp(), // Store creation time
                    });
                  } else {
                    // UPDATE: Update existing document
                    await notesCollection.doc(docId).update({
                      'title': title,
                      'content': content,
                      // We could also update a 'modifiedAt' field here
                    });
                  }

                  // Close the dialog after operation
                  if (mounted) Navigator.of(context).pop();
                }
              },
              child: Text(docId == null ? 'Add' : 'Update'),
            ),
          ],
        );
      },
    );
  }

  // D - DELETE
  Future<void> _deleteNote(String docId) async {
    await notesCollection.doc(docId).delete();

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Note deleted successfully')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My FireNotes'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),

      // R - READ (Real-time)
      // StreamBuilder listens to the Firestore stream.
      // Whenever the database changes, this builder re-runs!
      body: StreamBuilder<QuerySnapshot>(
        // We order by timestamp descending so newest notes appear first
        stream: notesCollection
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          // 1. Handle Loading State
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2. Handle Errors
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          // 3. Handle Empty Data
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No notes yet. Add one!"));
          }

          // 4. Display Data
          final notes = snapshot.data!.docs;

          return ListView.builder(
            itemCount: notes.length,
            padding: const EdgeInsets.all(8.0),
            itemBuilder: (context, index) {
              // Get the document snapshot
              final DocumentSnapshot document = notes[index];
              final String docId = document.id;

              // Cast data to Map to access fields easily
              final Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;

              // Helper to format timestamp safely
              String formattedDate = "Just now";
              if (data['timestamp'] != null) {
                Timestamp t = data['timestamp'];
                formattedDate = DateFormat.yMMMd().add_jm().format(t.toDate());
              }

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                elevation: 2,
                child: ListTile(
                  title: Text(
                    data['title'] ?? 'No Title',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(data['content'] ?? ''),
                      const SizedBox(height: 8),
                      Text(
                        formattedDate,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Edit Button
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () =>
                            _showNoteDialog(docId: docId, currentData: data),
                      ),
                      // Delete Button
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteNote(docId),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),

      // Floating Action Button to Add Note
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showNoteDialog(),
        label: const Text("Add Note"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
