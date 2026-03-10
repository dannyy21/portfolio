import 'package:flutter/material.dart';
import 'package:portfolio/theme/app_theme.dart';

class FeaturedProjectsSection extends StatelessWidget {
  const FeaturedProjectsSection({super.key});

  static final List<Map<String, dynamic>> _projects = [
    {
      'title': 'Diarium',
      'subtitle': 'HRIS Super App',
      'company': 'PT Telkom Indonesia',
      'duration': 'March 2023 — Aug 2024',
      'role': 'Flutter Developer (Senior)',
      'image': 'lib/assets/diarium.png',
      'description':
          'Diarium is an all-in-one mobile HRIS super app for Telkom Indonesia employees — managing attendance, leave, payslips, and internal comms for 20,000+ active users.',
      'technologies': ['Flutter', 'Firebase', 'REST API', 'Bloc', 'Dio'],
      'highlights': [
        'Developed and maintained features for Android and iOS',
        'Integrated RESTful APIs securely with optimized performance',
        'State management using Cubit/Bloc for consistent behavior',
        'Fixed UI jank, memory leaks, and slow renders',
        'Implemented real-time check-in and push notifications via FCM',
        'Offline-first strategies for low-network conditions',
        'Managed app release cycles including versioning and rollout',
      ],
      'gallery': [
        'lib/assets/diarium/1.jpg',
        'lib/assets/diarium/3.png',
        'lib/assets/diarium/4.png',
        'lib/assets/diarium/5.png',
        'lib/assets/diarium/6.png',
        'lib/assets/diarium/7.png',
        'lib/assets/diarium/8.png',
        'lib/assets/diarium/9.png',
        'lib/assets/diarium/10.png',
        'lib/assets/diarium/11.png',
        'lib/assets/diarium/12.png',
        'lib/assets/diarium/13.png',
        'lib/assets/diarium/14.png',
        'lib/assets/diarium/15.png',
        'lib/assets/diarium/16.png',
        'lib/assets/diarium/17.png',
        'lib/assets/diarium/18.png',
        'lib/assets/diarium/19.png',
        'lib/assets/diarium/20.png',
        'lib/assets/diarium/21.png',
        'lib/assets/diarium/22.png',
        'lib/assets/diarium/23.png',
        'lib/assets/diarium/24.png',
        'lib/assets/diarium/25.png',
        'lib/assets/diarium/26.png',
        'lib/assets/diarium/27.png',
      ],
    },
    {
      'title': 'Eventeer',
      'subtitle': 'Event Management App',
      'company': 'PT Telkom Indonesia',
      'duration': 'Aug 2022 — Dec 2022',
      'role': 'React Native Developer (Junior)',
      'image': 'lib/assets/eventeer.png',
      'description':
          'Eventeer simplifies event discovery, registration, and management — with QR check-ins, real-time updates, and organizer dashboards.',
      'technologies': ['React Native', 'Node.js', 'Expo', 'Redux'],
      'highlights': [
        'Built the app from scratch using React Native for Android and iOS',
        'Designed user-friendly interfaces for event browsing and registration',
        'Built QR code-based check-in system',
        'Implemented state management using React Context and Hooks',
        'Optimized performance across various device screen sizes',
      ],
      'gallery': [
        'lib/assets/eventeer/1.jpeg',
        'lib/assets/eventeer/2.png',
        'lib/assets/eventeer/3.png',
        'lib/assets/eventeer/4.jpeg',
        'lib/assets/eventeer/5.jpeg',
        'lib/assets/eventeer/6.jpeg',
      ],
    },
    {
      'title': 'PeopleHub',
      'subtitle': 'Employee Directory',
      'company': 'PT Swamedia Informatika',
      'duration': 'Aug 2024 — Present',
      'role': 'Flutter Developer (Mid)',
      'image': 'lib/assets/peoplehub.png',
      'description':
          'PeopleHub is an employee directory app for streamlined internal connectivity — featuring smart search, role-based access, organizational hierarchy, and in-app messaging.',
      'technologies': ['Flutter', 'Firebase', 'REST API', 'Bloc', 'Dio'],
      'highlights': [
        'Built a scalable employee directory app for Android and iOS',
        'Designed search, profile viewing, and department-based filtering',
        'Integrated secure authentication and role-based access',
        'Optimized widget rebuilds and scroll performance',
        'Used Flutter DevTools and Firebase Crashlytics for monitoring',
      ],
      'gallery': <String>[],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isMobile = w < 700;

    return Container(
      width: double.infinity,
      color: AppColors.bgPrimary,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : w * 0.08,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Featured Projects',
            subtitle: 'Professional projects I contributed to',
          ),
          const SizedBox(height: 40),
          ...List.generate(_projects.length, (i) {
            return Padding(
              padding:
                  EdgeInsets.only(bottom: i < _projects.length - 1 ? 48 : 0),
              child: _ProjectShowcase(
                project: _projects[i],
                isReversed: i.isOdd && !isMobile,
                isMobile: isMobile,
              ),
            );
          }),
        ],
      ),
    );
  }
}

// ─── Project Showcase Card ──────────────────────────────────────────
class _ProjectShowcase extends StatefulWidget {
  final Map<String, dynamic> project;
  final bool isReversed;
  final bool isMobile;

  const _ProjectShowcase({
    required this.project,
    required this.isReversed,
    required this.isMobile,
  });

  @override
  State<_ProjectShowcase> createState() => _ProjectShowcaseState();
}

class _ProjectShowcaseState extends State<_ProjectShowcase> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final p = widget.project;
    final gallery = p['gallery'] as List<String>;
    final hasGallery = gallery.isNotEmpty;

    return GlassCard(
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gallery carousel or placeholder
          if (hasGallery)
            _GalleryCarousel(images: gallery, isMobile: widget.isMobile)
          else
            _NoGalleryPlaceholder(image: p['image'] as String),

          // Content
          Padding(
            padding: EdgeInsets.all(widget.isMobile ? 20 : 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header row
                Row(
                  children: [
                    // Logo
                    Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white.withOpacity(0.05),
                      ),
                      child: Image.asset(
                        p['image'] as String,
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) => const Icon(
                            Icons.apps_rounded,
                            color: AppColors.textMuted),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(p['title'] as String,
                              style: AppTextStyles.headlineMedium),
                          const SizedBox(height: 2),
                          Text(
                            '${p['company']} • ${p['role']}',
                            style: AppTextStyles.labelSmall
                                .copyWith(color: AppColors.accentCyan),
                          ),
                        ],
                      ),
                    ),
                    if (!widget.isMobile)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.accentCyan.withOpacity(0.1),
                          border: Border.all(
                              color: AppColors.accentCyan.withOpacity(0.2)),
                        ),
                        child: Text(p['duration'] as String,
                            style: AppTextStyles.labelSmall
                                .copyWith(color: AppColors.accentCyan)),
                      ),
                  ],
                ),
                if (widget.isMobile) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.accentCyan.withOpacity(0.1),
                      border: Border.all(
                          color: AppColors.accentCyan.withOpacity(0.2)),
                    ),
                    child: Text(p['duration'] as String,
                        style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.accentCyan, fontSize: 11)),
                  ),
                ],
                const SizedBox(height: 16),
                // Description
                Text(p['description'] as String,
                    style: AppTextStyles.bodyMedium.copyWith(height: 1.6)),
                const SizedBox(height: 16),
                // Tech tags
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: (p['technologies'] as List<String>).map((tech) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.accentPurple.withOpacity(0.08),
                        border: Border.all(
                            color: AppColors.accentPurple.withOpacity(0.15)),
                      ),
                      child: Text(tech,
                          style: AppTextStyles.labelSmall.copyWith(
                              color: AppColors.accentPurple, fontSize: 11)),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                // Expand/collapse highlights
                GestureDetector(
                  onTap: () => setState(() => _isExpanded = !_isExpanded),
                  child: Row(
                    children: [
                      Icon(
                        _isExpanded
                            ? Icons.expand_less_rounded
                            : Icons.expand_more_rounded,
                        color: AppColors.accentCyan,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _isExpanded ? 'Hide details' : 'View key contributions',
                        style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.accentCyan,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                AnimatedCrossFade(
                  firstChild: const SizedBox.shrink(),
                  secondChild: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: (p['highlights'] as List<String>).map((h) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 7),
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: AppColors.gradientPrimary),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                  child: Text(h,
                                      style: AppTextStyles.bodyMedium
                                          .copyWith(height: 1.5))),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  crossFadeState: _isExpanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 300),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Gallery Carousel ────────────────────────────────────────────────
class _GalleryCarousel extends StatefulWidget {
  final List<String> images;
  final bool isMobile;
  const _GalleryCarousel({required this.images, required this.isMobile});
  @override
  State<_GalleryCarousel> createState() => _GalleryCarouselState();
}

class _GalleryCarouselState extends State<_GalleryCarousel> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(viewportFraction: widget.isMobile ? 0.85 : 0.35);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.isMobile ? 280 : 360,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.images.length,
            onPageChanged: (i) => setState(() => _currentPage = i),
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.glassBorder),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        widget.images[index],
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: AppColors.bgCard,
                          child: const Center(
                              child: Icon(Icons.broken_image_rounded,
                                  color: AppColors.textMuted, size: 32)),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        // Dots indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Left arrow
            IconButton(
              onPressed: _currentPage > 0
                  ? () => _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut)
                  : null,
              icon: Icon(Icons.chevron_left_rounded,
                  color: _currentPage > 0
                      ? AppColors.accentCyan
                      : AppColors.textMuted,
                  size: 20),
            ),
            Text(
              '${_currentPage + 1} / ${widget.images.length}',
              style: AppTextStyles.labelSmall
                  .copyWith(color: AppColors.textSecondary),
            ),
            // Right arrow
            IconButton(
              onPressed: _currentPage < widget.images.length - 1
                  ? () => _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut)
                  : null,
              icon: Icon(Icons.chevron_right_rounded,
                  color: _currentPage < widget.images.length - 1
                      ? AppColors.accentCyan
                      : AppColors.textMuted,
                  size: 20),
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

// ─── No Gallery Placeholder ────────────────────────────────────────
class _NoGalleryPlaceholder extends StatelessWidget {
  final String image;
  const _NoGalleryPlaceholder({required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        gradient: LinearGradient(
          colors: [
            AppColors.accentCyan.withOpacity(0.05),
            AppColors.accentPurple.withOpacity(0.05)
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 64,
              height: 64,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => const Icon(Icons.apps_rounded,
                  color: AppColors.textMuted, size: 48),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.lock_outline_rounded,
                    color: AppColors.textMuted, size: 14),
                const SizedBox(width: 6),
                Text('Screenshots under NDA', style: AppTextStyles.labelSmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
