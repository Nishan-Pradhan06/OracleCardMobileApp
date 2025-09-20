import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/widgets/custom_container.dart';

class AdminDashCardWdiget extends StatelessWidget {
  final void Function()? onTap;
  final String svgPath;
  final String title;
  final String subtitle;

  const AdminDashCardWdiget({
    super.key,
    this.onTap,
    required this.svgPath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      onTap: onTap,
      height: MediaQuery.sizeOf(context).height * 0.18,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(svgPath),
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              subtitle,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: Colors.grey.shade700),
            ),
          ],
        ),
      ),
    );
  }
}
