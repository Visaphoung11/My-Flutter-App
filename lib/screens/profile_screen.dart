import 'package:flutter/material.dart';
import 'package:my_first_app/screens/create_property_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage('images/image.jpg'),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Itunuoluwa Abidoye",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "@itunuoluwa",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit, color: Colors.white),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Options
            _profileTile(
              icon: Icons.person_outline,
              title: "My Account",
              subtitle: "Make changes to your account",
              trailing: const Icon(Icons.warning_amber, color: Colors.red),
              onTap: () {},
            ),
            _profileTile(
              icon: Icons.account_balance_outlined,
              title: "Saved Beneficiary",
              subtitle: "Manage your saved account",
              onTap: () {},
            ),
            _profileTile(
              icon: Icons.fingerprint,
              title: "Face ID / Touch ID",
              subtitle: "Manage your device security",
              trailing: Switch(value: false, onChanged: (v) {}),
            ),
            _profileTile(
              icon: Icons.security,
              title: "Two-Factor Authentication",
              subtitle: "Further secure your account",
              onTap: () {},
            ),
            _profileTile(
              icon: Icons.add_home_work,
              title: "Create Property",
              subtitle: "Add a new property listing",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreatePropertyScreen(),
                  ),
                );
              },
            ),
            _profileTile(
              icon: Icons.logout,
              title: "Log out",
              subtitle: "Further secure your account",
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileTile({
    required IconData icon,
    required String title,
    required String subtitle,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.withOpacity(0.1),
          child: Icon(icon, color: Colors.blue),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
        trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}