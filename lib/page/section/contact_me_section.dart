import 'package:flutter/material.dart';
import 'package:portfolio/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMeSection extends StatelessWidget {
  const ContactMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 700;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.bgSecondary,
            AppColors.bgPrimary,
          ],
        ),
      ),
      child: Column(
        children: [
          // CTA Section
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : screenWidth * 0.15,
              vertical: 80,
            ),
            child: Column(
              children: [
                // Gradient accent line
                Container(
                  width: 60,
                  height: 4,
                  decoration: BoxDecoration(
                    gradient: AppColors.gradientPrimary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 32),
                GradientText(
                  text: "Let's Work Together",
                  style: isMobile
                      ? AppTextStyles.headlineLarge
                      : AppTextStyles.displayMedium,
                ),
                const SizedBox(height: 16),
                Text(
                  "Have a project in mind? Let's build something amazing together.\nI'm always open to new opportunities and collaborations.",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyLarge,
                ),
                const SizedBox(height: 40),

                // Action buttons
                Wrap(
                  spacing: 16,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: [
                    GradientButton(
                      text: 'Send me an email',
                      icon: Icons.arrow_outward_rounded,
                      onPressed: () async {
                        final Uri gmailUri = Uri.parse(
                          'https://mail.google.com/mail/?view=cm&fs=1&to=dannyptr21@gmail.com&su=Hello Danny&body=I would like to discuss...',
                        );
                        if (await canLaunchUrl(gmailUri)) {
                          await launchUrl(gmailUri);
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // Social links
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _SocialLink(
                      icon: Icons.code_rounded,
                      label: 'GitHub',
                      url: 'https://github.com',
                    ),
                    const SizedBox(width: 32),
                    _SocialLink(
                      icon: Icons.business_center_rounded,
                      label: 'LinkedIn',
                      url: 'https://www.linkedin.com/in/danny-putra-pertama/',
                    ),
                    const SizedBox(width: 32),
                    _SocialLink(
                      icon: Icons.email_rounded,
                      label: 'Email',
                      url: 'mailto:dannyptr21@gmail.com',
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Footer
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: AppColors.glassBorder,
                  width: 1,
                ),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Designed & Built by Danny Putra Pertama',
                  style: AppTextStyles.labelSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  '© 2025 All Rights Reserved',
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.textMuted.withOpacity(0.6),
                    fontSize: 11,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialLink extends StatefulWidget {
  final IconData icon;
  final String label;
  final String url;

  const _SocialLink({
    required this.icon,
    required this.label,
    required this.url,
  });

  @override
  State<_SocialLink> createState() => _SocialLinkState();
}

class _SocialLinkState extends State<_SocialLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () async {
          final Uri uri = Uri.parse(widget.url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: _isHovered
                        ? AppColors.accentCyan.withOpacity(0.5)
                        : AppColors.glassBorder,
                  ),
                  color: _isHovered
                      ? AppColors.accentCyan.withOpacity(0.1)
                      : Colors.transparent,
                  boxShadow: _isHovered
                      ? [
                          BoxShadow(
                            color: AppColors.accentCyan.withOpacity(0.2),
                            blurRadius: 16,
                          ),
                        ]
                      : [],
                ),
                child: Icon(
                  widget.icon,
                  size: 22,
                  color:
                      _isHovered ? AppColors.accentCyan : AppColors.textMuted,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.label,
                style: AppTextStyles.labelSmall.copyWith(
                  color:
                      _isHovered ? AppColors.accentCyan : AppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
