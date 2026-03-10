import 'package:flutter/material.dart';
import 'package:portfolio/theme/app_theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isMobile = w < 700;

    return Container(
      width: double.infinity,
      color: AppColors.bgSecondary,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : w * 0.08,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'About Me', subtitle: 'A quick overview'),
          const SizedBox(height: 32),
          if (!isMobile)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 3, child: _buildBio()),
                const SizedBox(width: 48),
                Expanded(flex: 2, child: _buildStats()),
              ],
            )
          else ...[
            _buildBio(),
            const SizedBox(height: 32),
            _buildStats(),
          ],
        ],
      ),
    );
  }

  Widget _buildBio() {
    return GlassCard(
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "I'm Danny, a mobile developer based in Bandung, Indonesia with 3+ years of experience building production-grade applications.",
            style: AppTextStyles.bodyLarge.copyWith(height: 1.7),
          ),
          const SizedBox(height: 16),
          Text(
            "I specialize in Flutter and React Native, focusing on clean architecture, beautiful UI, and exceptional user experiences. "
            "I've contributed to apps serving thousands of daily users at companies like Telkom Indonesia and Swamedia Informatika.",
            style: AppTextStyles.bodyMedium.copyWith(height: 1.7),
          ),
          const SizedBox(height: 16),
          Text(
            "When I'm not coding, I'm exploring new frameworks, contributing to side projects, and constantly pushing myself to grow as an engineer.",
            style: AppTextStyles.bodyMedium.copyWith(height: 1.7),
          ),
        ],
      ),
    );
  }

  Widget _buildStats() {
    final stats = [
      {'number': '3+', 'label': 'Years\nExperience'},
      {'number': '5+', 'label': 'Projects\nDelivered'},
      {'number': '20K+', 'label': 'Active\nUsers Served'},
      {'number': '2', 'label': 'Companies\nWorked With'},
    ];

    return Column(
      children: [
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.1,
          children: stats.map((stat) {
            return GlassCard(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GradientText(
                    text: stat['number']!,
                    style: AppTextStyles.displayMedium
                        .copyWith(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    stat['label']!,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.labelSmall.copyWith(height: 1.3),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
