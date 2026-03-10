import 'package:flutter/material.dart';
import 'package:portfolio/theme/app_theme.dart';

class WorkExperienceSection extends StatefulWidget {
  const WorkExperienceSection({Key? key}) : super(key: key);

  @override
  _WorkExperienceSectionState createState() => _WorkExperienceSectionState();
}

class _WorkExperienceSectionState extends State<WorkExperienceSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  final List<Map<String, String>> _workExperiences = [
    {
      'companyLogo': 'lib/assets/telkomindonesia.png',
      'companyName': 'PT Telkom Indonesia',
      'duration': 'March 2023 - Aug 2024',
      'location': 'Bandung, Indonesia',
      'projectLogo': 'lib/assets/diarium.png',
      'projectName': 'Diarium',
      'jobTitle': 'Flutter Developer',
      'seniority': 'Senior',
      'role':
          'Built and maintained the Diarium HRIS super app serving 20,000+ active users.',
    },
    {
      'companyLogo': 'lib/assets/telkomindonesia.png',
      'companyName': 'PT Telkom Indonesia',
      'duration': 'Aug 2022 - Dec 2022',
      'location': 'Bandung, Indonesia',
      'projectLogo': 'lib/assets/eventeer.png',
      'projectName': 'Eventeer',
      'jobTitle': 'React Native Developer',
      'seniority': 'Junior',
      'role':
          'Developed the event management app with QR check-in and real-time updates.',
    },
    {
      'companyLogo': 'lib/assets/swalogo.png',
      'companyName': 'PT Swamedia Informatika',
      'duration': 'Aug 2024 - Present',
      'location': 'Bandung, Indonesia',
      'projectLogo': 'lib/assets/peoplehub.png',
      'projectName': 'People Hub',
      'jobTitle': 'Flutter Developer',
      'seniority': 'Mid',
      'role':
          'Building the employee directory platform with role-based access and real-time data.',
    },
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 700;

    return Container(
      width: double.infinity,
      color: AppColors.bgPrimary,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.08,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Work Experience',
            subtitle: 'My professional journey so far',
          ),
          const SizedBox(height: 48),

          // Timeline
          ...List.generate(_workExperiences.length, (index) {
            final experience = _workExperiences[index];
            final isLast = index == _workExperiences.length - 1;
            final delay = index * 0.2;

            return _TimelineEntry(
              experience: experience,
              isLast: isLast,
              isMobile: isMobile,
              animation: Tween<double>(begin: 0, end: 1).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: Interval(
                    delay.clamp(0.0, 0.6),
                    (delay + 0.4).clamp(0.4, 1.0),
                    curve: Curves.easeOutCubic,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _TimelineEntry extends StatelessWidget {
  final Map<String, String> experience;
  final bool isLast;
  final bool isMobile;
  final Animation<double> animation;

  const _TimelineEntry({
    required this.experience,
    required this.isLast,
    required this.isMobile,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Opacity(
          opacity: animation.value,
          child: Transform.translate(
            offset: Offset(40 * (1 - animation.value), 0),
            child: child,
          ),
        );
      },
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Timeline line + dot
            SizedBox(
              width: 40,
              child: Column(
                children: [
                  // Glowing dot
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: AppColors.gradientPrimary,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.accentCyan.withOpacity(0.4),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                  ),
                  // Line
                  if (!isLast)
                    Expanded(
                      child: Container(
                        width: 2,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.accentCyan.withOpacity(0.3),
                              AppColors.accentPurple.withOpacity(0.1),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            // Card content
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: isLast ? 0 : 32),
                child: GlassCard(
                  padding: EdgeInsets.all(isMobile ? 16 : 24),
                  child:
                      isMobile ? _buildMobileContent() : _buildDesktopContent(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopContent() {
    return Row(
      children: [
        // Company logo
        Container(
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white.withOpacity(0.05),
          ),
          child: Image.asset(
            experience['companyLogo']!,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(width: 20),
        // Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                experience['jobTitle'] ?? '',
                style: AppTextStyles.titleLarge,
              ),
              const SizedBox(height: 4),
              Text(
                '${experience['companyName']} • ${experience['projectName']}',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.accentCyan,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                experience['role'] ?? '',
                style: AppTextStyles.bodyMedium,
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        // Duration & Location
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.accentCyan.withOpacity(0.1),
                border: Border.all(
                  color: AppColors.accentCyan.withOpacity(0.2),
                ),
              ),
              child: Text(
                experience['duration'] ?? '',
                style: AppTextStyles.labelSmall.copyWith(
                  color: AppColors.accentCyan,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.location_on_outlined,
                    size: 14, color: AppColors.textMuted),
                const SizedBox(width: 4),
                Text(
                  experience['location'] ?? '',
                  style: AppTextStyles.labelSmall,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 44,
              height: 44,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.05),
              ),
              child: Image.asset(
                experience['companyLogo']!,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    experience['jobTitle'] ?? '',
                    style: AppTextStyles.titleMedium,
                  ),
                  Text(
                    experience['companyName'] ?? '',
                    style: AppTextStyles.labelSmall.copyWith(
                      color: AppColors.accentCyan,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(experience['role'] ?? '', style: AppTextStyles.bodyMedium),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _TagChip(text: experience['duration'] ?? ''),
            _TagChip(text: experience['location'] ?? ''),
            _TagChip(text: experience['projectName'] ?? ''),
          ],
        ),
      ],
    );
  }
}

class _TagChip extends StatelessWidget {
  final String text;
  const _TagChip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.glassFill,
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Text(
        text,
        style: AppTextStyles.labelSmall.copyWith(fontSize: 11),
      ),
    );
  }
}
