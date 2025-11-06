import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdminCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;
  final bool automaticallyImplyLeading; // <-- Added toggle

  const AdminCustomAppBar({
    super.key,
    required this.title,
    this.height = 100,
    this.automaticallyImplyLeading = false, // <-- default false
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: height,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 🔹 Show back button if automaticallyImplyLeading is true, else show notification icon
              automaticallyImplyLeading
                  ? InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset('assets/icons/back.svg'),
                      ),
                    )
                  : Container(
                      height: 35,
                      width: 35,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 2,
                            spreadRadius: 1,
                            offset: const Offset(1, 0),
                          ),
                        ],
                      ),
                      child: SvgPicture.asset('assets/svg/bell.svg'),
                    ),
              Container(
                height: 30,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF6B48FF),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/svg/verified.svg'),
                    const SizedBox(width: 5),
                    Text(
                      'Admin',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF6B48FF),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
