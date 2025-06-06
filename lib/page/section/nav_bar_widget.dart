import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NavbarWidget extends StatelessWidget {
  final VoidCallback onHome;

  final VoidCallback onProjects;

  const NavbarWidget({
    required this.onHome,

    required this.onProjects,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 40),
          _buildNavItem('Home', onHome),

          _buildNavItem('Projects', onProjects),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.email, color: Colors.blue, size: 20),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () async {
                    final Uri gmailUri = Uri.parse(
                      'https://mail.google.com/mail/?view=cm&fs=1&to=dannyptr21@gmail.com&su=Hello Danny&body=I would like to discuss...',
                    );
                    if (await canLaunchUrl(gmailUri)) {
                      await launchUrl(gmailUri);
                    }
                  },
                  child: const Text(
                    'dannyptr21@gmail.com',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
