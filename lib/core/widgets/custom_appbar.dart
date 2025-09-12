import 'package:flutter/material.dart';

/// Enum to control title alignment in CustomAppBar
enum TitleAlignment { center, left }

/// A custom AppBar widget built by developer.
/// Supports title, actions, leading, background color, elevation, optional height, title alignment, and automatically adding back button.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final double elevation;
  final List<Widget>? actions;
  final Widget? leading;
  final double? height;
  final TitleAlignment titleAlignment;
  final bool automaticallyImplyLeading;

  const CustomAppBar({
    super.key,
    required this.title,
    this.backgroundColor = Colors.white,
    this.elevation = 0.01,
    this.actions,
    this.leading,
    this.height,
    this.titleAlignment = TitleAlignment.center,
    this.automaticallyImplyLeading = true,
  });

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    Widget? leadingWidget = leading;

    // Automatically add a back button if implied and possible
    if (leadingWidget == null &&
        automaticallyImplyLeading &&
        Navigator.canPop(context)) {
      leadingWidget = IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      );
    }

    return Material(
      color: backgroundColor,
      elevation: elevation,
      child: SafeArea(
        child: Container(
          height: preferredSize.height,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              leadingWidget ?? const SizedBox.shrink(),
              Expanded(
                child: Align(
                  alignment: titleAlignment == TitleAlignment.center
                      ? Alignment.center
                      : Alignment.centerLeft,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              if (actions != null) ...actions!,
            ],
          ),
        ),
      ),
    );
  }
}
