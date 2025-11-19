import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Quote Generator'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> quotes = [
    """Let us pick up our books and our pens. They are our most powerful weapons.""",
    """Reading is not the key to success, but it is the key to unlocking the success that is within us.""",
    """Success is not final, failure is not fatal: It is the courage to continue that counts.""",
  ];

  @override
  void initState() {
    super.initState();
    quotes.add("""I love dart and flutter""");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: GoogleFonts.outfit(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(16),
              child: Text(
                quotes.last,
                style: GoogleFonts.outfit(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            quotes.shuffle();
            if (quotes.length > 3) {
              quotes.removeAt(quotes.length - 1);
            }
          });
        },
        tooltip: 'Generate Quote',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
