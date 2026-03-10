import 'package:flutter/material.dart';
import 'package:portfolio/theme/app_theme.dart';

class SkillSetSection extends StatelessWidget {
  const SkillSetSection({super.key});

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
          const SectionTitle(
            title: 'Skills & Tools',
            subtitle: 'Technologies and tools I work with daily',
          ),
          const SizedBox(height: 40),

          // ── Languages & Frameworks ──
          _CategoryLabel(label: 'Languages & Frameworks'),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _SkillChip(
                  name: 'Flutter',
                  image: 'lib/assets/flutter.png',
                  level: 0.95),
              _SkillChip(
                  name: 'FlutterFlow',
                  image: 'lib/assets/flutterflow.jpg',
                  level: 0.85),
              _SkillChip(
                  name: 'React Native',
                  image: 'lib/assets/react.png',
                  level: 0.75),
              _SkillChip(
                  name: 'Kotlin', image: 'lib/assets/kotlin.png', level: 0.70),
              _SkillChip(
                  name: 'Swift', image: 'lib/assets/swift.jpg', level: 0.65),
              _SkillChip(name: 'Dart', level: 0.95),
            ],
          ),

          const SizedBox(height: 36),

          // ── Core Competencies ──
          _CategoryLabel(label: 'Core Competencies'),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _CompetencyTag(
                  label: 'State Management (Bloc/Cubit)',
                  icon: Icons.sync_rounded,
                  color: const Color(0xFF7B61FF)),
              _CompetencyTag(
                  label: 'REST API Integration',
                  icon: Icons.cloud_rounded,
                  color: const Color(0xFF00D4FF)),
              _CompetencyTag(
                  label: 'UI/UX Implementation',
                  icon: Icons.design_services_rounded,
                  color: const Color(0xFFFF6B9D)),
              _CompetencyTag(
                  label: 'Firebase & Analytics',
                  icon: Icons.local_fire_department_rounded,
                  color: const Color(0xFFFFCA28)),
              _CompetencyTag(
                  label: 'Local Storage',
                  icon: Icons.storage_rounded,
                  color: const Color(0xFF00E5A0)),
              _CompetencyTag(
                  label: 'Clean Architecture',
                  icon: Icons.architecture_rounded,
                  color: const Color(0xFF02569B)),
              _CompetencyTag(
                  label: 'Testing & CI/CD',
                  icon: Icons.verified_rounded,
                  color: const Color(0xFF4CAF50)),
              _CompetencyTag(
                  label: 'Performance Optimization',
                  icon: Icons.speed_rounded,
                  color: const Color(0xFFFF5722)),
              _CompetencyTag(
                  label: 'Push Notifications',
                  icon: Icons.notifications_active_rounded,
                  color: const Color(0xFF9C27B0)),
            ],
          ),

          const SizedBox(height: 36),

          // ── Tools & Platforms ──
          _CategoryLabel(label: 'Tools & Platforms'),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _ToolTag(label: 'Android Studio'),
              _ToolTag(label: 'VS Code'),
              _ToolTag(label: 'Git / GitHub'),
              _ToolTag(label: 'Figma'),
              _ToolTag(label: 'Postman'),
              _ToolTag(label: 'Firebase Console'),
              _ToolTag(label: 'ClickUp'),
              _ToolTag(label: 'Slack'),
              _ToolTag(label: 'Jira'),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Category Label ─────────────────────────────────────────────
class _CategoryLabel extends StatelessWidget {
  final String label;
  const _CategoryLabel({required this.label});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 3,
          height: 16,
          decoration: BoxDecoration(
              gradient: AppColors.gradientPrimary,
              borderRadius: BorderRadius.circular(1.5)),
        ),
        const SizedBox(width: 10),
        Text(label,
            style: AppTextStyles.titleMedium
                .copyWith(color: AppColors.textSecondary)),
      ],
    );
  }
}

// ─── Skill Chip with image + progress ───────────────────────────
class _SkillChip extends StatefulWidget {
  final String name;
  final String? image;
  final double level;
  const _SkillChip({required this.name, this.image, required this.level});
  @override
  State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  bool _h = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _h = true),
      onExit: (_) => setState(() => _h = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: _h ? Colors.white.withOpacity(0.06) : AppColors.glassFill,
          border: Border.all(
              color: _h
                  ? AppColors.accentCyan.withOpacity(0.3)
                  : AppColors.glassBorder),
          boxShadow: _h
              ? [
                  BoxShadow(
                      color: AppColors.accentCyan.withOpacity(0.06),
                      blurRadius: 16)
                ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.image != null) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  widget.image!,
                  width: 28,
                  height: 28,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) =>
                      const SizedBox(width: 28, height: 28),
                ),
              ),
              const SizedBox(width: 10),
            ],
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name,
                    style: AppTextStyles.labelLarge.copyWith(fontSize: 13)),
                const SizedBox(height: 4),
                SizedBox(
                  width: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: LinearProgressIndicator(
                      value: widget.level,
                      minHeight: 3,
                      backgroundColor: AppColors.glassBorder,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        _h
                            ? AppColors.accentCyan
                            : AppColors.accentCyan.withOpacity(0.6),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Competency Tag ──────────────────────────────────────────────
class _CompetencyTag extends StatefulWidget {
  final String label;
  final IconData icon;
  final Color color;
  const _CompetencyTag(
      {required this.label, required this.icon, required this.color});
  @override
  State<_CompetencyTag> createState() => _CompetencyTagState();
}

class _CompetencyTagState extends State<_CompetencyTag> {
  bool _h = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _h = true),
      onExit: (_) => setState(() => _h = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: _h ? widget.color.withOpacity(0.1) : AppColors.glassFill,
          border: Border.all(
              color:
                  _h ? widget.color.withOpacity(0.3) : AppColors.glassBorder),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(widget.icon,
                size: 16, color: _h ? widget.color : AppColors.textMuted),
            const SizedBox(width: 8),
            Text(widget.label,
                style: AppTextStyles.labelSmall.copyWith(
                    color: _h ? widget.color : AppColors.textSecondary,
                    fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

// ─── Tool Tag ────────────────────────────────────────────────────
class _ToolTag extends StatelessWidget {
  final String label;
  const _ToolTag({required this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.glassFill,
        border: Border.all(color: AppColors.glassBorder),
      ),
      child:
          Text(label, style: AppTextStyles.labelSmall.copyWith(fontSize: 12)),
    );
  }
}
