import 'package:anogi_delivery/component/my_drawer_title.dart';
import 'package:anogi_delivery/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:anogi_delivery/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // Logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          // Divider
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          // Home
          MyDrawerTitle(
            text: "H O M E",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),

          // Settings
          MyDrawerTitle(
            text: "S E T T I N G S",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            },
          ),

          const Spacer(),

          // Logout (✅ Fixed)
          MyDrawerTitle(
            text: "L O G O U T",
            icon: Icons.logout,
            onTap: () async {
              Navigator.pop(context);  // Close drawer first
              await AuthService().signOut();  // Sign out
              // No need to navigate manually if your AuthGate is correctly implemented
            },
          ),

          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
