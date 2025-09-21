import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/widgets/custom_container.dart';

class LibraryCardWidget extends StatelessWidget {
  final String svgUrl;
  final String title;
  final String description;
  const LibraryCardWidget({
    super.key,
    required this.svgUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      svgOverlayPath: 'assets/svg/library_overlay.svg',
      useIntrinsicHeight: true,
      showSvgOverlay: true,
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            spacing: 20,
            children: [
              SvgPicture.asset(svgUrl),
              Text(
                title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Text(
            description,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
