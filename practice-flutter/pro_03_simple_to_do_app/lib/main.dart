import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoApp(),
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.outfitTextTheme(),
        colorSchemeSeed: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ToDo {
  final String title;
  final String description;
  final bool isCompleted;

  ToDo({
    required this.title,
    required this.description,
    required this.isCompleted,
  });
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  // List of 5 tasks, each starting as not completed (false)
  final List<ToDo> _tasks = [];

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Task', style: GoogleFonts.outfit()),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: 'Task Title',
                  hintStyle: GoogleFonts.outfit(),
                ),
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  hintText: 'Task Description',
                  hintStyle: GoogleFonts.outfit(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel', style: GoogleFonts.outfit()),
            ),
            TextButton(
              onPressed: () {
                final task = ToDo(
                  title: _titleController.text,
                  description: _descriptionController.text,
                  isCompleted: false,
                );
                setState(() {
                  _tasks.add(task);
                  _titleController.clear();
                  _descriptionController.clear();
                });
                Navigator.of(context).pop();
              },
              child: Text('Add', style: GoogleFonts.outfit()),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do App', style: GoogleFonts.outfit()),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      // Scrollable list that builds one tile per task
      body: ListView.builder(
        // Number of items = number of tasks
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            // Checkbox to mark the task as done / not done
            leading: Checkbox(
              value: _tasks[index].isCompleted,
              onChanged: (value) {
                setState(() {
                  // Toggle the task state at this index by replacing the ToDo
                  final current = _tasks[index];
                  _tasks[index] = ToDo(
                    title: current.title,
                    description: current.description,
                    isCompleted: !current.isCompleted,
                  );
                });
              },
            ),
            // Main text showing the task index and its current state
            title: Text(
              _tasks[index].title,
              style: GoogleFonts.outfit(
                decoration: _tasks[index].isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                color: _tasks[index].isCompleted ? Colors.grey : Colors.black,
              ),
            ),
            // Extra description text for the task
            subtitle: Text(
              _tasks[index].description,
              style: GoogleFonts.outfit(
                decoration: _tasks[index].isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                color: _tasks[index].isCompleted ? Colors.grey : Colors.black,
              ),
            ),
            // Delete icon to remove this task from the list
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _tasks.removeAt(index);
                });
              },
            ),
            // When the tile itself is tapped, show a SnackBar message
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Hello World from To Do Task $index')),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
