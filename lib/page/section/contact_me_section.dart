import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;

        // Adjust padding based on screen width
        double padding = screenWidth < 600 ? 16 : 100;
        double iconSize = screenWidth < 600 ? 50 : 60; // Dynamic icon size
        double fontSize = screenWidth < 600 ? 12 : 14; // Dynamic font size for labels
        double headerFontSize = screenWidth < 600 ? 22 : 28; // Dynamic header font size

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFE8F0FF), Color(0xFFE8F0FF)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text(
                'Contact Me',
                style: TextStyle(
                  fontSize: headerFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey.shade700,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildContactIcon(
                    icon: Icons.code,
                    label: 'GitHub',
                    onTap: () => _launchURL('https://github.com'),
                    iconSize: iconSize,
                    fontSize: fontSize,
                  ),
                  SizedBox(width: screenWidth < 600 ? 16 : 50), // Adjust spacing for small screens
                  _buildContactIcon(
                    icon: Icons.business_center,
                    label: 'LinkedIn',
                    onTap: () => _launchURL('https://www.linkedin.com/in/danny-putra-pertama/'),
                    iconSize: iconSize,
                    fontSize: fontSize,
                  ),
                ],
              ),
              SizedBox(height: 50),
              // Uncomment if you want to add a custom wave background
              // CustomPaint(
              //   size: Size(double.infinity, 100),
              //   painter: SoftWavePainter(),
              // ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContactIcon({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required double iconSize,
    required double fontSize,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: iconSize,
            width: iconSize,
            decoration: BoxDecoration(
              color: Color(0xFFE8F0FF),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.blueGrey.shade100,
                  blurRadius: 6,
                  spreadRadius: 3,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Icon(
              icon,
              size: iconSize * 0.6, // Adjust icon size proportionally
              color: Colors.blueAccent,
            ),
          ),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.blueGrey.shade700,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class SoftWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xFFE8F0FF).withOpacity(0.6);

    Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
      size.width * 0.5, size.height + 30, // Puncak gelombang
      size.width, size.height - 50,
    );
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
