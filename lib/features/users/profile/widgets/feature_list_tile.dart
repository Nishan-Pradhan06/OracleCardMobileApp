import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FeatureListTile extends StatelessWidget {
  final String featureTitle;
  const FeatureListTile({super.key, required this.featureTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6,
      children: [
        SvgPicture.asset('assets/icons/circle_mark.svg'),
        Text(featureTitle, style: TextTheme.of(context).bodyLarge),
      ],
    );
  }
}
