import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/widgets/custom_container.dart';

class MeditatoinsCardWidget extends StatelessWidget {
  final String svgUrl;
  final String title;
  final String timer;
  final bool isLock;
  final void Function()? onTap;
  const MeditatoinsCardWidget({
    super.key,
    required this.svgUrl,
    required this.title,
    required this.timer,
    this.isLock = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      useIntrinsicHeight: true,
      child: Row(
        spacing: 10,

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 10,
            children: [
              SvgPicture.asset(svgUrl),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 2,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    spacing: 6,
                    children: [
                      SvgPicture.asset('assets/icons/time_grey.svg'),
                      Text(
                        timer,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: isLock ? null : onTap,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(isLock ? 0xFFF0F0F0 : 0xFF6B48FF),
              ),
              child: Center(
                child: SvgPicture.asset(
                  isLock ? 'assets/icons/lock.svg' : 'assets/icons/play.svg',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
