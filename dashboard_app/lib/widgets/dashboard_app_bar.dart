import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: AppTheme.primaryPurple,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.account_balance, color: Colors.white, size: 20),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TREASURY REGISTRAR',
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey[600],
              letterSpacing: 1.0,
            ),
          ),
          const Text(
            'PIMS Dashboard',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none),
          onPressed: () {},
        ),
        const CircleAvatar(
          backgroundColor: AppTheme.lightPurple,
          radius: 16,
          child: Icon(
            Icons.person_outline,
            color: AppTheme.primaryPurple,
            size: 20,
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
