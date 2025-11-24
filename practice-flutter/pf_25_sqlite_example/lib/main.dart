import 'package:flutter/material.dart';
import 'item_database.dart';

/// Entry point of the app.
///
/// We make sure Flutter bindings are initialized, then initialize
/// the SQLite database via [ItemDatabase.init], and finally start
/// the app with [MyApp].
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Open / create the SQLite database (see item_database.dart).
  await ItemDatabase.init();

  runApp(const MyApp());
}

/// Root widget of the application.
///
/// It only sets up theming and routes; all CRUD logic lives in
/// [ItemDatabase] and the UI in [HomePage].
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sqflite CRUD Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

/// Simple screen that displays a list of items stored in SQLite
/// and lets the user perform all CRUD operations.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Controller for the text field (used for both create and update).
  final TextEditingController _controller = TextEditingController();

  /// If null, we are creating a new item.
  /// If not null, we are editing the item with this id.
  int? _editingId;

  /// In-memory cache of rows from the `items` table.
  List<Map<String, dynamic>> _items = [];

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  /// Load all items from the database and refresh the UI.
  Future<void> _loadItems() async {
    final items = await ItemDatabase.getItems();
    setState(() {
      _items = items;
    });
  }

  /// Handle the "Add" action: insert a new row into the table.
  Future<void> _createItem(String name) async {
    if (name.trim().isEmpty) return;
    await ItemDatabase.createItem(name);
    _controller.clear();
    await _loadItems();
  }

  /// Handle the "Save" action when editing an existing item.
  Future<void> _updateItem(int id, String name) async {
    if (name.trim().isEmpty) return;
    await ItemDatabase.updateItem(id, name);
    _controller.clear();
    setState(() {
      _editingId = null;
    });
    await _loadItems();
  }

  /// Delete an item from the table by id.
  Future<void> _deleteItem(int id) async {
    await ItemDatabase.deleteItem(id);
    await _loadItems();
  }

  /// Start editing: fill the text field and remember which id we edit.
  void _startEditing(Map<String, dynamic> item) {
    setState(() {
      _editingId = item['id'] as int;
      _controller.text = item['name'] as String;
    });
  }

  /// Cancel editing and reset the form.
  void _cancelEditing() {
    setState(() {
      _editingId = null;
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sqflite CRUD Example'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Top input row: text field + buttons.
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          labelText: _editingId == null
                              ? 'New item name'
                              : 'Edit item name',
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (_editingId != null)
                      IconButton(
                        onPressed: _cancelEditing,
                        icon: const Icon(Icons.close),
                        tooltip: 'Cancel editing',
                      ),
                    ElevatedButton(
                      onPressed: () {
                        final text = _controller.text;
                        if (_editingId == null) {
                          _createItem(text);
                        } else {
                          _updateItem(_editingId!, text);
                        }
                      },
                      child: Text(_editingId == null ? 'Add' : 'Save'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // List of items from the database.
            Expanded(
              child: _items.isEmpty
                  ? const Center(
                      child: Text(
                        'No items yet. Add one above to see it here.',
                        textAlign: TextAlign.center,
                      ),
                    )
                  : ListView.builder(
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        final item = _items[index];
                        return Card(
                          child: ListTile(
                            title: Text(item['name'] as String),
                            subtitle: Text('ID: ${item['id']}'),
                            onTap: () => _startEditing(item),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete_outline),
                              onPressed: () => _deleteItem(item['id'] as int),
                              tooltip: 'Delete',
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
