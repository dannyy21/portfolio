import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:portfolio/page/projects/list_projects.dart';
import 'package:url_launcher/url_launcher.dart';

class TopSection extends StatefulWidget {
  final VoidCallback scrollToPortfolioEducation;

  const TopSection(this.scrollToPortfolioEducation, {super.key});

  @override
  _TopSectionState createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // Durasi animasi
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Mulai dari bawah layar
      end: Offset.zero, // Berhenti di posisi aslinya
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Mulai animasi saat widget muncul
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFF8F9FD),
                Color(0xFFE8F0FF),
              ],
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100.0, vertical: 62),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 40),
                          _buildNavItem('Home', () {}),
                          _buildNavItem(
                            'Portfolio & Education',
                            widget.scrollToPortfolioEducation,
                          ),
                          _buildNavItem('Projects', () {
                            Navigator.pushNamed(context, '/list-projects');
                          }),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.email,
                                    color: Colors.blue, size: 20),
                                const SizedBox(width: 8),
                                GestureDetector(
                                  onTap: () async {
                                    final Uri gmailUri = Uri.parse(
                                      'https://mail.google.com/mail/?view=cm&fs=1&to=dannyptr21@gmail.com&su=Hello Danny&body=I would like to discuss...',
                                    );

                                    if (await canLaunchUrl(gmailUri)) {
                                      await launchUrl(gmailUri);
                                    } else {
                                      throw 'Could not launch $gmailUri';
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
                    ),
                    const SizedBox(height: 48),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Hi!',
                                style: TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                              RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: "I'm Danny Putra Pertama\na "),
                                    TextSpan(
                                      text: 'Mobile Developer',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 24),
                              Text(
                                "Hi, I'm Danny mobile developer from Bandung, Indonesia.",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 32),
                              OutlinedButton(
                                onPressed: () async {
                                  final Uri url = Uri.parse(
                                      'https://drive.google.com/uc?export=download&id=1AxEzShGKp-qPG0swEaqPxDlQZ0IhHG4m');
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 32,
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  side: BorderSide(color: Colors.grey[300]!),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Download CV'),
                                    SizedBox(width: 8),
                                    Icon(Icons.download, size: 20),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 390,
                          width: 390,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: OverflowBox(
                              alignment: Alignment.center,
                              maxHeight: double.infinity,
                              maxWidth: double.infinity,
                              child: Transform.scale(
                                scale: 0.8.clamp(0.5, 3.0),
                                child: Image.asset(
                                  'lib/assets/photo.png',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    developer.log(
                                        'Error loading profile image: $error');
                                    return Container(
                                      color: Colors.grey[300],
                                      child: const Center(
                                        child: Icon(Icons.error,
                                            color: Colors.red),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
