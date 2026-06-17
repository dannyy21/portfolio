import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:portfolio/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class TopSection extends StatefulWidget {
  const TopSection({super.key});

  @override
  State<TopSection> createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  // Typing effect
  late AnimationController _cursorController;
  final List<String> _roles = [
    'Mobile Developer',
    'Flutter Engineer',
    'React Native Dev',
    'UI Enthusiast',
  ];
  int _currentRoleIndex = 0;
  String _displayText = '';
  bool _isDeleting = false;
  Timer? _typingTimer;

  // Particle animation
  late AnimationController _particleController;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _fadeAnimation =
        CurvedAnimation(parent: _fadeController, curve: Curves.easeOutCubic);
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.12),
      end: Offset.zero,
    ).animate(
        CurvedAnimation(parent: _fadeController, curve: Curves.easeOutCubic));
    _fadeController.forward();

    _cursorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);

    _particleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();

    _startTypingEffect();
  }

  void _startTypingEffect() {
    const typingSpeed = Duration(milliseconds: 80);
    const deletingSpeed = Duration(milliseconds: 40);
    const pauseDuration = Duration(milliseconds: 2000);

    _typingTimer = Timer.periodic(
      _isDeleting ? deletingSpeed : typingSpeed,
      (timer) {
        if (!mounted) {
          timer.cancel();
          return;
        }
        setState(() {
          final fullText = _roles[_currentRoleIndex];
          if (!_isDeleting) {
            if (_displayText.length < fullText.length) {
              _displayText = fullText.substring(0, _displayText.length + 1);
            } else {
              _isDeleting = true;
              timer.cancel();
              _typingTimer = Timer(pauseDuration, () {
                if (mounted) _startTypingEffect();
              });
            }
          } else {
            if (_displayText.isNotEmpty) {
              _displayText = _displayText.substring(0, _displayText.length - 1);
            } else {
              _isDeleting = false;
              _currentRoleIndex = (_currentRoleIndex + 1) % _roles.length;
              timer.cancel();
              _typingTimer = Timer(const Duration(milliseconds: 300), () {
                if (mounted) _startTypingEffect();
              });
            }
          }
        });
      },
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _cursorController.dispose();
    _particleController.dispose();
    _typingTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final isMobile = w < 700;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(minHeight: h * 0.9),
          decoration: const BoxDecoration(gradient: AppColors.gradientHero),
          child: Stack(
            children: [
              // Particles (Disabled for web performance)
              // AnimatedBuilder(
              //   animation: _particleController,
              //   builder: (context, _) => CustomPaint(
              //     size: Size(w, h * 0.9),
              //     painter: _ParticlePainter(_particleController.value),
              //   ),
              // ),
              // Gradient orbs
              Positioned(
                top: -100,
                right: isMobile ? -50 : w * 0.1,
                child: Container(
                  width: isMobile ? 250 : 400,
                  height: isMobile ? 250 : 400,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(colors: [
                      AppColors.accentCyan.withOpacity(0.08),
                      Colors.transparent,
                    ]),
                  ),
                ),
              ),
              Positioned(
                bottom: -50,
                left: -100,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(colors: [
                      AppColors.accentPurple.withOpacity(0.06),
                      Colors.transparent,
                    ]),
                  ),
                ),
              ),
              // Content
              Padding(
                padding: EdgeInsets.only(
                  left: isMobile ? 24 : w * 0.08,
                  right: isMobile ? 24 : w * 0.08,
                  top: isMobile ? 100 : 120,
                  bottom: 60,
                ),
                child: isMobile ? _buildMobile() : _buildDesktop(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktop() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 3, child: _buildText(false)),
        const SizedBox(width: 60),
        Expanded(flex: 2, child: _buildPhoto(false)),
      ],
    );
  }

  Widget _buildMobile() {
    return Column(
      children: [
        _buildPhoto(true),
        const SizedBox(height: 36),
        _buildText(true),
      ],
    );
  }

  Widget _buildText(bool isMobile) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Available badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.accentCyan.withOpacity(0.3)),
            color: AppColors.accentCyan.withOpacity(0.05),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.accentGreen,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.accentGreen.withOpacity(0.5),
                        blurRadius: 6)
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text('Available for work',
                  style: AppTextStyles.labelSmall.copyWith(
                      color: AppColors.accentGreen,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          "Hi, I'm",
          style: (isMobile
                  ? AppTextStyles.headlineMedium
                  : AppTextStyles.displayMedium)
              .copyWith(
                  color: AppColors.textSecondary, fontWeight: FontWeight.w400),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 4),
        Text(
          'Danny Putra\nPertama',
          style: isMobile
              ? AppTextStyles.headlineLarge
              : AppTextStyles.displayLarge,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 16),
        // Typing row
        Row(
          mainAxisSize: isMobile ? MainAxisSize.min : MainAxisSize.max,
          children: [
            Text('a ',
                style: (isMobile
                        ? AppTextStyles.titleLarge
                        : AppTextStyles.headlineMedium)
                    .copyWith(color: AppColors.textSecondary)),
            GradientText(
                text: _displayText,
                style: isMobile
                    ? AppTextStyles.titleLarge
                    : AppTextStyles.headlineMedium),
            AnimatedBuilder(
              animation: _cursorController,
              builder: (_, __) => Opacity(
                opacity: _cursorController.value > 0.5 ? 1 : 0,
                child: Container(
                  width: 3,
                  height: isMobile ? 22 : 28,
                  margin: const EdgeInsets.only(left: 2),
                  decoration: BoxDecoration(
                      gradient: AppColors.gradientPrimary,
                      borderRadius: BorderRadius.circular(1)),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          "A mobile developer from Bandung, Indonesia.\nCrafting premium apps with clean code & pixel-perfect UI.",
          style: AppTextStyles.bodyLarge,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 36),
        // CTAs
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            GradientButton(
              text: 'Download CV',
              icon: Icons.download_rounded,
              onPressed: () => _launch(
                  'https://drive.google.com/uc?export=download&id=1AxEzShGKp-qPG0swEaqPxDlQZ0IhHG4m'),
            ),
            _OutlineButton(
              text: 'View My Work',
              icon: Icons.arrow_downward_rounded,
              onPressed: () {
                // Scroll to projects section — handled by parent via key
                Scrollable.ensureVisible(
                  context,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOutCubic,
                  alignment: 1.0,
                );
              },
            ),
            _OutlineButton(
              text: 'Personal Notes',
              useAppleIcon: true,
              onPressed: () => _launch(
                  'https://docs.google.com/document/d/1h9c-_BXp-mBn1snrBxShuIGBaFg_GUMtdRROy6ZpBtU/edit?tab=t.0'),
            ),
          ],
        ),
        const SizedBox(height: 36),
        // Socials
        Row(
          mainAxisSize: isMobile ? MainAxisSize.min : MainAxisSize.max,
          children: [
            _SocialIcon(
                icon: Icons.code_rounded,
                tooltip: 'GitHub',
                onTap: () => _launch('https://github.com/dannyy21')),
            const SizedBox(width: 16),
            _SocialIcon(
                icon: Icons.business_center_rounded,
                tooltip: 'LinkedIn',
                onTap: () => _launch(
                    'https://www.linkedin.com/in/danny-putra-pertama/')),
            const SizedBox(width: 16),
            _SocialIcon(
                icon: Icons.work_outline_rounded,
                tooltip: 'Upwork',
                onTap: () => _launch(
                    'https://www.upwork.com/freelancers/~01f5fb5f83710c9cba')),
            const SizedBox(width: 16),
            _SocialIcon(
                icon: Icons.email_rounded,
                tooltip: 'Email',
                onTap: () => _launch('mailto:dannyptr21@gmail.com')),
          ],
        ),
      ],
    );
  }

  Widget _buildPhoto(bool isMobile) {
    final size = isMobile ? 180.0 : 320.0;
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Spinning glow ring
          AnimatedBuilder(
            animation: _particleController,
            builder: (_, __) => Container(
              width: size + 36,
              height: size + 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: SweepGradient(
                  startAngle: _particleController.value * 2 * math.pi,
                  endAngle:
                      _particleController.value * 2 * math.pi + math.pi * 2,
                  colors: [
                    AppColors.accentCyan.withOpacity(0.5),
                    AppColors.accentPurple.withOpacity(0.5),
                    AppColors.accentPink.withOpacity(0.3),
                    AppColors.accentCyan.withOpacity(0.5),
                  ],
                ),
              ),
            ),
          ),
          Container(
              width: size + 28,
              height: size + 28,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.bgPrimary)),
          ClipOval(
            child: Transform.translate(
              offset: isMobile ? const Offset(10, 0) : const Offset(15, 0),
              child: Transform.scale(
                scale: 1.06,
                child: Image.asset(
                  'lib/assets/photo.png',
                  fit: BoxFit.cover,
                  width: size,
                  height: size,
                  errorBuilder: (_, __, ___) => Container(
                    width: size,
                    height: size,
                    color: AppColors.bgCard,
                    child: const Center(
                        child: Icon(Icons.person,
                            color: AppColors.textMuted, size: 60)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri))
      await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

// ─── Apple Icon ──────────────────────────────────────────────────
class _AppleIcon extends StatelessWidget {
  final double size;
  final Color? color;
  const _AppleIcon({this.size = 18, this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _AppleIconPainter(color ?? AppColors.textSecondary),
    );
  }
}

class _AppleIconPainter extends CustomPainter {
  final Color color;
  _AppleIconPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final w = size.width;
    final h = size.height;

    final body = Path()
      ..moveTo(w * 0.54, h * 0.2)
      ..cubicTo(w * 0.72, h * 0.2, w * 0.9, h * 0.38, w * 0.88, h * 0.62)
      ..cubicTo(w * 0.86, h * 0.86, w * 0.66, h * 0.96, w * 0.5, h * 0.96)
      ..cubicTo(w * 0.3, h * 0.96, w * 0.12, h * 0.82, w * 0.14, h * 0.58)
      ..cubicTo(w * 0.16, h * 0.36, w * 0.34, h * 0.2, w * 0.54, h * 0.2)
      ..close();

    final bite = Path()
      ..addOval(Rect.fromCircle(
          center: Offset(w * 0.74, h * 0.6), radius: w * 0.11));

    final leaf = Path()
      ..moveTo(w * 0.54, h * 0.2)
      ..quadraticBezierTo(w * 0.62, h * 0.04, w * 0.72, h * 0.1)
      ..quadraticBezierTo(w * 0.6, h * 0.12, w * 0.54, h * 0.2);

    canvas.drawPath(Path.combine(PathOperation.difference, body, bite), paint);
    canvas.drawPath(leaf, paint);
  }

  @override
  bool shouldRepaint(covariant _AppleIconPainter oldDelegate) =>
      oldDelegate.color != color;
}

// ─── Outline Button ──────────────────────────────────────────────
class _OutlineButton extends StatefulWidget {
  final String text;
  final IconData? icon;
  final bool useAppleIcon;
  final VoidCallback onPressed;
  const _OutlineButton(
      {required this.text,
      this.icon,
      this.useAppleIcon = false,
      required this.onPressed});
  @override
  State<_OutlineButton> createState() => _OutlineButtonState();
}

class _OutlineButtonState extends State<_OutlineButton> {
  bool _h = false;
  @override
  Widget build(BuildContext context) {
    final iconColor =
        _h ? AppColors.accentCyan : AppColors.textSecondary;
    return MouseRegion(
      onEnter: (_) => setState(() => _h = true),
      onExit: (_) => setState(() => _h = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: _h
                    ? AppColors.accentCyan.withOpacity(0.6)
                    : AppColors.glassBorder),
            color: _h
                ? AppColors.accentCyan.withOpacity(0.05)
                : Colors.transparent,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.text,
                  style: AppTextStyles.labelLarge.copyWith(
                      color: iconColor)),
              if (widget.useAppleIcon) ...[
                const SizedBox(width: 10),
                _AppleIcon(size: 18, color: iconColor),
              ] else if (widget.icon != null) ...[
                const SizedBox(width: 10),
                Icon(widget.icon, color: iconColor, size: 18)
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Social Icon ─────────────────────────────────────────────────
class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;
  const _SocialIcon(
      {required this.icon, required this.tooltip, required this.onTap});
  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _h = false;
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        onEnter: (_) => setState(() => _h = true),
        onExit: (_) => setState(() => _h = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: _h
                      ? AppColors.accentCyan.withOpacity(0.5)
                      : AppColors.glassBorder),
              color: _h
                  ? AppColors.accentCyan.withOpacity(0.1)
                  : Colors.transparent,
            ),
            child: Icon(widget.icon,
                size: 20,
                color: _h ? AppColors.accentCyan : AppColors.textMuted),
          ),
        ),
      ),
    );
  }
}
