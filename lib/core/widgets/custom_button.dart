import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  // Customization options
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Gradient? gradient;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final Color? borderColor;
  final double borderWidth;
  final bool isDisabled;
  final List<BoxShadow>? boxShadow;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.width,
    this.height,
    this.backgroundColor,
    this.gradient,
    this.textColor = Colors.white,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.leadingIcon,
    this.trailingIcon,
    this.borderColor,
    this.borderWidth = 0,
    this.isDisabled = false,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    const Color defaultEnabledColor = Color(0xFF6B48FF);
    const Color defaultDisabledColor = Color.fromARGB(87, 107, 70, 193);

    final Color effectiveColor =
        backgroundColor ??
        (isDisabled ? defaultDisabledColor : defaultEnabledColor);

    return AbsorbPointer(
      absorbing: isDisabled || isLoading,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: gradient,
          color: gradient == null ? effectiveColor : null,
          borderRadius: borderRadius,
          border: borderColor != null
              ? Border.all(color: borderColor!, width: borderWidth)
              : null,
          boxShadow: boxShadow,
        ),
        child: Material(
          type: MaterialType.transparency,
          borderRadius: borderRadius,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            borderRadius: borderRadius,
            onTap: onPressed,
            splashColor: Colors.white.withValues(alpha: 0.15),
            child: Center(
              child: Padding(
                padding: padding,
                child: isLoading
                    ? const SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          color: Colors.white,
                        ),
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (leadingIcon != null) ...[
                            leadingIcon!,
                            const SizedBox(width: 8),
                          ],
                          Text(
                            text,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: textColor,
                              fontSize: fontSize,
                              fontWeight: fontWeight,
                            ),
                          ),
                          if (trailingIcon != null) ...[
                            const SizedBox(width: 8),
                            trailingIcon!,
                          ],
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  // Customization
  final double? width;
  final double? height;
  final Color? backgroundColor; // optional transparent background
  final Gradient? gradient; // rare for outline, but included for parity
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final Color borderColor;
  final double borderWidth;
  final bool isDisabled;
  final List<BoxShadow>? boxShadow;

  const CustomOutlineButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.width,
    this.height,
    this.backgroundColor = Colors.transparent,
    this.gradient,
    this.textColor = const Color(0xFF6B48FF),
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.leadingIcon,
    this.trailingIcon,
    this.borderColor = const Color(0xFF6B48FF),
    this.borderWidth = 1.5,
    this.isDisabled = false,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    const Color disabledColor = Color.fromARGB(120, 107, 70, 193);

    final Color effectiveBorderColor = isDisabled ? disabledColor : borderColor;

    final Color effectiveTextColor = isDisabled ? disabledColor : textColor;

    return AbsorbPointer(
      absorbing: isDisabled || isLoading,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: gradient,
          color: gradient == null ? backgroundColor : null,
          borderRadius: borderRadius,
          border: Border.all(color: effectiveBorderColor, width: borderWidth),
          boxShadow: boxShadow,
        ),
        child: Material(
          type: MaterialType.transparency,
          borderRadius: borderRadius,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            borderRadius: borderRadius,
            onTap: onPressed,
            splashColor: effectiveBorderColor.withOpacity(0.15),
            child: Center(
              child: Padding(
                padding: padding,
                child: isLoading
                    ? const SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          color: Color(0xFF6B48FF),
                        ),
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (leadingIcon != null) ...[
                            leadingIcon!,
                            const SizedBox(width: 8),
                          ],
                          Text(
                            text,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: effectiveTextColor,
                              fontSize: fontSize,
                              fontWeight: fontWeight,
                            ),
                          ),
                          if (trailingIcon != null) ...[
                            const SizedBox(width: 8),
                            trailingIcon!,
                          ],
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
