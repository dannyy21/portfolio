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

class _TopSectionState extends State<TopSection> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 700; // Mobile check
    final textTheme = Theme.of(context).textTheme;

     return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
         child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFF8F9FD),
                Color(0xFFE8F0FF),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : 100.0, // Dynamic padding for mobile and larger screens
              vertical: 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Layout based on screen size (Mobile vs Desktop)
                if (isMobile) ...[
                  SafeArea(
                    child: Stack(
                      alignment: Alignment.topCenter, // Tambahkan alignment untuk Stack
                      children: [
                        // Konten utama Column
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center, // Pusatkan teks untuk mobile
                          children: [
                            SizedBox(height: 32,),
                            const Text(
                              'Hi!',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.black, // Tambahkan warna jika tidak default
                              ),
                            ),
                            const SizedBox(height: 16),
                            RichText(
                              textAlign: TextAlign.center, // Pusatkan RichText
                              text: const TextSpan(
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(text: "I'm Danny Putra Pertama\na "),
                                  TextSpan(
                                    text: 'Mobile Developer',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              "Hi, I'm Danny, a mobile developer from Bandung, Indonesia.",
                              textAlign: TextAlign.center, // Pusatkan teks
                              style: TextStyle(
                                fontSize: 14,
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
                                  // Gunakan dialog atau SnackBar sebagai ganti throw
                                  // Contoh: ScaffoldMessenger.of(context).showSnackBar(
                                  //   const SnackBar(content: Text('Could not launch URL')),
                                  // );
                                  developer.log('Could not launch $url');
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
                            const SizedBox(height: 20), // Tambahkan spasi di bawah button sebelum gambar
                          ],
                        ),
                        // Gambar profil di-posisikan sebagai anak langsung dari Stack
                        Positioned(
                          // Sesuaikan positioning jika diperlukan, mungkin di atas kolom teks
                          // Untuk membuat gambar tidak tumpang tindih dengan teks, Anda perlu
                          // menyesuaikan posisi atau memastikan Column memiliki padding/margin yang cukup
                          // atau posisikan gambar di luar area yang ditempati Column.
                          // Untuk contoh, saya posisikan di atas Column, agak ke tengah atas.
                          top: 20, // Atau sesuaikan
                          child: Transform.translate(
                            offset: Offset(0, -50), // Geser ke atas agar tidak tumpang tindih dengan Hi!
                            child: Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 4,
                                ),
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  'lib/assets/photo.png',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    developer.log('Error loading profile image: $error');
                                    return Container(
                                      color: Colors.grey[300],
                                      child: const Center(
                                        child: Icon(Icons.error, color: Colors.red),
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
                  ),
                ] else ...[
                  // Bagian untuk desktop/layar besar (tidak ada perubahan struktural di sini)
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Hi!',
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
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
                                  TextSpan(text: "I'm Danny Putra Pertama\na "),
                                  TextSpan(
                                    text: 'Mobile Developer',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              "Hi, I'm Danny, a mobile developer from Bandung, Indonesia.",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 32),

                            // Button for larger screens
                            OutlinedButton(
                              onPressed: () async {
                                final Uri url = Uri.parse(
                                    'https://drive.google.com/uc?export=download&id=1AxEzShGKp-qPG0swEaqPxDlQZ0IhHG4m');
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                } else {
                                  // Gunakan dialog atau SnackBar sebagai ganti throw
                                  developer.log('Could not launch $url');
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
                        height: isMobile ? 250 : 390,
                        width: isMobile ? 250 : 390,
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
                                  developer.log('Error loading profile image: $error');
                                  return Container(
                                    color: Colors.grey[300],
                                    child: const Center(
                                      child: Icon(Icons.error, color: Colors.red),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Metode _buildNavItem tidak terkait langsung dengan HeroSection,
  // tetapi disertakan jika itu adalah bagian dari class yang sama.
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
