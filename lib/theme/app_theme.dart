import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ─── Design Tokens ──────────────────────────────────────────────────────────

class AppColors {
  // Background
  static const Color bgPrimary = Color(0xFF0A0E21);
  static const Color bgSecondary = Color(0xFF0F1328);
  static const Color bgCard = Color(0xFF141A33);

  // Accents
  static const Color accentCyan = Color(0xFF00D4FF);
  static const Color accentPurple = Color(0xFF7B61FF);
  static const Color accentPink = Color(0xFFFF6B9D);
  static const Color accentGreen = Color(0xFF00E5A0);

  // Text
  static const Color textPrimary = Color(0xFFEAECF5);
  static const Color textSecondary = Color(0xFF8892B0);
  static const Color textMuted = Color(0xFF5A6380);

  // Glass
  static const Color glassBorder = Color(0x20FFFFFF);
  static const Color glassFill = Color(0x08FFFFFF);

  // Gradients
  static const LinearGradient gradientPrimary = LinearGradient(
    colors: [accentCyan, accentPurple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient gradientHero = LinearGradient(
    colors: [
      Color(0xFF0A0E21),
      Color(0xFF0D1230),
      Color(0xFF131842),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient gradientCard = LinearGradient(
    colors: [
      Color(0x15FFFFFF),
      Color(0x05FFFFFF),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

// ─── Text Styles ─────────────────────────────────────────────────────────────

class AppTextStyles {
  static TextStyle get displayLarge => GoogleFonts.spaceGrotesk(
        fontSize: 56,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        height: 1.1,
      );

  static TextStyle get displayMedium => GoogleFonts.spaceGrotesk(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        height: 1.2,
      );

  static TextStyle get headlineLarge => GoogleFonts.spaceGrotesk(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  static TextStyle get headlineMedium => GoogleFonts.spaceGrotesk(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  static TextStyle get titleLarge => GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  static TextStyle get titleMedium => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  static TextStyle get bodyLarge => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: 1.7,
      );

  static TextStyle get bodyMedium => GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: 1.6,
      );

  static TextStyle get labelLarge => GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        letterSpacing: 1.2,
      );

  static TextStyle get labelSmall => GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.textMuted,
      );
}

// ─── Reusable Decorations ─────────────────────────────────────────────────

class AppDecorations {
  static BoxDecoration get glassCard => BoxDecoration(
        color: AppColors.glassFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.glassBorder, width: 1),
      );

  static BoxDecoration glassCardWithGlow(Color glowColor) => BoxDecoration(
        color: AppColors.glassFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.glassBorder, width: 1),
        boxShadow: [
          BoxShadow(
            color: glowColor.withOpacity(0.15),
            blurRadius: 30,
            spreadRadius: -5,
          ),
        ],
      );

  static BoxDecoration get gradientBorder => BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: AppColors.gradientCard,
        border: Border.all(color: AppColors.glassBorder, width: 1),
      );
}

// ─── GlassCard Widget ────────────────────────────────────────────────────

class GlassCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? glowColor;
  final VoidCallback? onTap;

  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.glowColor,
    this.onTap,
  });

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          padding: widget.padding ?? const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: _isHovered ? const Color(0x12FFFFFF) : AppColors.glassFill,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isHovered
                  ? (widget.glowColor ?? AppColors.accentCyan).withOpacity(0.3)
                  : AppColors.glassBorder,
              width: 1,
            ),
            boxShadow: const [], // Removed heavy shadow for web performance
          ),
          transform: _isHovered
              ? (Matrix4.identity()..translate(0.0, -4.0))
              : Matrix4.identity(),
          child: widget.child,
        ),
      ),
    );
  }
}

// ─── Gradient Text Widget ────────────────────────────────────────────────

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;

  const GradientText({
    super.key,
    required this.text,
    required this.style,
    this.gradient = AppColors.gradientPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}

// ─── Section Title Widget ────────────────────────────────────────────────

class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;

  const SectionTitle({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: isMobile ? 28 : 36,
              decoration: BoxDecoration(
                gradient: AppColors.gradientPrimary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 16),
            GradientText(
              text: title,
              style: isMobile
                  ? AppTextStyles.headlineMedium
                  : AppTextStyles.headlineLarge,
            ),
          ],
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(subtitle!, style: AppTextStyles.bodyMedium),
          ),
        ],
      ],
    );
  }
}

// ─── Gradient Button Widget ──────────────────────────────────────────────

class GradientButton extends StatefulWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;

  const GradientButton({
    super.key,
    required this.text,
    this.icon,
    required this.onPressed,
  });

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: BoxDecoration(
            gradient: AppColors.gradientPrimary,
            borderRadius: BorderRadius.circular(12),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: AppColors.accentCyan.withOpacity(0.4),
                      blurRadius: 20,
                      spreadRadius: -3,
                    ),
                  ]
                : [
                    BoxShadow(
                      color: AppColors.accentCyan.withOpacity(0.2),
                      blurRadius: 12,
                      spreadRadius: -3,
                    ),
                  ],
          ),
          transform: _isHovered
              ? (Matrix4.identity()..translate(0.0, -2.0))
              : Matrix4.identity(),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.text,
                style: AppTextStyles.labelLarge.copyWith(
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),
              if (widget.icon != null) ...[
                const SizedBox(width: 10),
                Icon(widget.icon, color: Colors.white, size: 18),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// ─── App ThemeData ───────────────────────────────────────────────────────

ThemeData appTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.bgPrimary,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.accentCyan,
      secondary: AppColors.accentPurple,
      surface: AppColors.bgSecondary,
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyles.displayLarge,
      displayMedium: AppTextStyles.displayMedium,
      headlineLarge: AppTextStyles.headlineLarge,
      headlineMedium: AppTextStyles.headlineMedium,
      titleLarge: AppTextStyles.titleLarge,
      titleMedium: AppTextStyles.titleMedium,
      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.bodyMedium,
      labelLarge: AppTextStyles.labelLarge,
      labelSmall: AppTextStyles.labelSmall,
    ),
    useMaterial3: true,
  );
}
