import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oracle_card_app/core/widgets/custom_container.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import '../../../../core/widgets/admin_appbar.dart';
import '../../../../core/widgets/custom_background.dart';

class AdminDasboardScreen extends StatelessWidget {
  const AdminDasboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminCustomAppBar(title: 'Admin Dashboard'),
      body: CustomBackground(
        child: SingleChildScrollView(
          child: CustomPadding(
            child: Column(
              spacing: 20,
              children: [
                AdminDashCardWdiget(
                  svgPath: 'assets/svg/card.svg',
                  title: 'Deck & Cards',
                  subtitle: 'Manage decks and cards',
                ),
                AdminDashCardWdiget(
                  svgPath: 'assets/svg/meditation.svg',
                  title: 'Meditations',
                  subtitle: 'Manage meditation items',
                ),
                AdminDashCardWdiget(
                  svgPath: 'assets/svg/sessions.svg',
                  title: 'Sessions',
                  subtitle: 'Manage group sessions',
                ),
                AdminDashCardWdiget(
                  svgPath: 'assets/svg/idea.svg',
                  title: 'Daily Guidance',
                  subtitle: 'Manage daily guidance',
                ),
                AdminDashCardWdiget(
                  svgPath: 'assets/svg/boardcast.svg',
                  title: 'Broadcasts',
                  subtitle: 'Manage broadcasts',
                ),
                AdminDashCardWdiget(
                  svgPath: 'assets/svg/users.svg',
                  title: 'Users & Billing',
                  subtitle: 'View users and billing',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
