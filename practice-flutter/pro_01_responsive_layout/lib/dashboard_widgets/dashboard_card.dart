import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    super.key,
    required this.bgColor,
    required this.icon,
    required this.title,
  });

  final Color bgColor;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      elevation: 0,
      color: bgColor,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: Theme.of(context).colorScheme.primary),
            SizedBox(height: 10),
            Text(
              title,
              style: GoogleFonts.outfit(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
