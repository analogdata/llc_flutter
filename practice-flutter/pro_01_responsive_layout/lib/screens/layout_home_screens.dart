import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_01_responsive_layout/dashboard_widgets/dashboard_card.dart';

class HomeScreenLayout extends StatefulWidget {
  const HomeScreenLayout({super.key});

  @override
  State<HomeScreenLayout> createState() => _HomeScreenLayoutState();
}

class _HomeScreenLayoutState extends State<HomeScreenLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Hello Username!',
                  style: GoogleFonts.outfit(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: DashboardCard(
                    bgColor: Theme.of(context).primaryColor.withAlpha(30),
                    icon: Icons.person,
                    title: 'Profile',
                  ),
                ),
                Expanded(
                  child: DashboardCard(
                    bgColor: Theme.of(context).primaryColor.withAlpha(30),
                    icon: Icons.message,
                    title: 'Message',
                  ),
                ),
                Expanded(
                  child: DashboardCard(
                    bgColor: Theme.of(context).primaryColor.withAlpha(30),
                    icon: Icons.apps_rounded,
                    title: 'Apps',
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: Card.filled(
                elevation: 0,
                color: Theme.of(context).primaryColor.withAlpha(30),
                child: Center(
                  child: Text(
                    "Content Area",
                    style: GoogleFonts.outfit(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 2,
        backgroundColor: Theme.of(context).primaryColor.withAlpha(20),
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
          NavigationDestination(icon: Icon(Icons.help), label: 'Help'),
        ],
      ),
    );
  }
}
