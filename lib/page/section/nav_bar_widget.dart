import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class NavbarWidget extends StatelessWidget {
  final String activeSection;
  final ValueChanged<String> onNavTap;

  const NavbarWidget({
    required this.activeSection,
    required this.onNavTap,
    super.key,
  });

  static const _navItems = [
    'Home',
    'About',
    'Projects',
    'Skills',
    'Experience',
    'Contact'
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: AppColors.bgPrimary.withOpacity(0.8),
            border: const Border(
              bottom: BorderSide(color: AppColors.glassBorder, width: 1),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo
              GestureDetector(
                onTap: () => onNavTap('Home'),
                child: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.accentCyan,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.accentCyan.withOpacity(0.5),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'danny.',
                      style: AppTextStyles.titleLarge.copyWith(
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
              ),

              if (!isMobile) ...[
                Row(
                  children: [
                    for (final item in _navItems)
                      _NavItem(
                        title: item,
                        isActive: activeSection == item,
                        onTap: () => onNavTap(item),
                      ),
                    const SizedBox(width: 16),
                    GradientButton(
                      text: "Let's Talk",
                      icon: Icons.arrow_outward_rounded,
                      onPressed: () async {
                        final Uri uri = Uri.parse(
                          'https://mail.google.com/mail/?view=cm&fs=1&to=dannyptr21@gmail.com&su=Hello Danny&body=I would like to discuss...',
                        );
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        }
                      },
                    ),
                  ],
                ),
              ] else ...[
                PopupMenuButton<String>(
                  icon: const Icon(Icons.menu_rounded,
                      color: AppColors.textPrimary),
                  color: AppColors.bgCard,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: AppColors.glassBorder),
                  ),
                  onSelected: (value) => onNavTap(value),
                  itemBuilder: (context) => _navItems.map((item) {
                    final isActive = activeSection == item;
                    return PopupMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: isActive
                              ? AppColors.accentCyan
                              : AppColors.textPrimary,
                          fontWeight:
                              isActive ? FontWeight.w600 : FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem(
      {required this.title, required this.isActive, required this.onTap});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isHighlighted = widget.isActive || _isHovered;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isHighlighted ? AppColors.glassFill : Colors.transparent,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: isHighlighted
                      ? AppColors.accentCyan
                      : AppColors.textSecondary,
                  fontWeight: isHighlighted ? FontWeight.w600 : FontWeight.w400,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 2),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2,
                width: widget.isActive ? 20 : (_isHovered ? 12 : 0),
                decoration: BoxDecoration(
                  gradient: AppColors.gradientPrimary,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
