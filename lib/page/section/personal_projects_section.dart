import 'package:flutter/material.dart';
import 'package:portfolio/theme/app_theme.dart';

class PersonalProjectsSection extends StatelessWidget {
  const PersonalProjectsSection({super.key});

  static final List<Map<String, dynamic>> _projects = [
    {
      'title': 'EazyTask Kiosk',
      'description':
          'An attendance kiosk application for Australian companies, enabling employees to check in and out through dedicated on-site devices for streamlined workforce tracking.',
      'technologies': ['Flutter', 'APIs', 'Offline Sync'],
      'icon': Icons.tablet_mac_rounded,
      'color': const Color(0xFF00E5A0),
    },
    {
      'title': 'Qilife Scan',
      'description':
          'A mobile application designed to analyze and detect Qi energy through scanning technology and customized questionnaires.',
      'technologies': ['FlutterFlow', 'Low-Code', 'Multimedia'],
      'icon': Icons.scanner_rounded,
      'color': const Color(0xFF7B61FF),
    },
    {
      'title': 'Bas Recovery',
      'description':
          'A UAE-based automotive service application connecting users with vehicle recovery and workshop roadside assistance services.',
      'technologies': ['Flutter', 'React Native', 'Node.js'],
      'icon': Icons.car_crash_rounded,
      'color': const Color(0xFFFF6B9D),
    },
    {
      'title': 'Fitters',
      'description':
          'A Canada-based fitness companion application designed to help users connect with fitness partners and track shared workout activities.',
      'technologies': ['Flutter', 'React Native'],
      'icon': Icons.fitness_center_rounded,
      'color': const Color(0xFF00E5A0),
    },
    {
      'title': 'Danone Scan App',
      'description':
          'A native Android smart gallon scanner demo app designed to identify and validate water gallons using computer vision.',
      'technologies': ['Kotlin', 'Android', 'Computer Vision'],
      'icon': Icons.water_drop_rounded,
      'color': const Color(0xFF7B61FF),
    },
    {
      'title': 'My Haayd App',
      'description':
          'A mobile application built with React Native focusing on pixel-perfect UI slicing, reusable components, and responsive cross-platform layout.',
      'technologies': ['React Native', 'Figma', 'UI/UX'],
      'icon': Icons.smartphone_rounded,
      'color': const Color(0xFFFF6B9D),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isMobile = w < 700;
    final crossAxisCount = isMobile ? 1 : 3;

    return Container(
      width: double.infinity,
      color: AppColors.bgPrimary,
      padding: EdgeInsets.only(
        left: isMobile ? 24 : w * 0.08,
        right: isMobile ? 24 : w * 0.08,
        bottom: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Freelance & Other Projects',
            subtitle: 'Freelance client work and diverse portfolio projects',
          ),
          const SizedBox(height: 32),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: isMobile ? 1.6 : 0.85,
            ),
            itemCount: _projects.length,
            itemBuilder: (context, index) {
              final p = _projects[index];
              return _PersonalProjectCard(project: p);
            },
          ),
        ],
      ),
    );
  }
}

class _PersonalProjectCard extends StatefulWidget {
  final Map<String, dynamic> project;
  const _PersonalProjectCard({required this.project});
  @override
  State<_PersonalProjectCard> createState() => _PersonalProjectCardState();
}

class _PersonalProjectCardState extends State<_PersonalProjectCard> {
  bool _h = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.project;
    final color = p['color'] as Color;

    return MouseRegion(
      onEnter: (_) => setState(() => _h = true),
      onExit: (_) => setState(() => _h = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: _h ? Colors.white.withOpacity(0.04) : AppColors.glassFill,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: _h ? color.withOpacity(0.3) : AppColors.glassBorder),
          boxShadow: _h
              ? [
                  BoxShadow(
                      color: color.withOpacity(0.08),
                      blurRadius: 24,
                      spreadRadius: -4)
                ]
              : [],
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: color.withOpacity(0.12),
              ),
              child: Icon(p['icon'] as IconData, size: 24, color: color),
            ),
            const SizedBox(height: 16),
            Text(p['title'] as String, style: AppTextStyles.titleLarge),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                p['description'] as String,
                style: AppTextStyles.bodyMedium,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: (p['technologies'] as List<String>).take(4).map((t) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: color.withOpacity(0.08),
                    border: Border.all(color: color.withOpacity(0.15)),
                  ),
                  child: Text(t,
                      style: AppTextStyles.labelSmall
                          .copyWith(color: color, fontSize: 10)),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
