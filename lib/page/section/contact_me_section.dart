import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey.shade700,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildContactIcon(
                icon: Icons.code,
                label: 'GitHub',
                onTap: () => _launchURL('https://github.com'),
              ),
              _buildContactIcon(
                icon: Icons.business_center,
                label: 'LinkedIn',
                onTap: () => _launchURL('https://www.linkedin.com/in/danny-putra-pertama/'),
              ),
            ],
          ),
          SizedBox(height: 50),
          // CustomPaint(
          //   size: Size(double.infinity, 100),
          //   painter: SoftWavePainter(),
          // ),
        ],
      ),
    );
  }

  Widget _buildContactIcon({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
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
              size: 30,
              color: Colors.blueAccent,
            ),
          ),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
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
