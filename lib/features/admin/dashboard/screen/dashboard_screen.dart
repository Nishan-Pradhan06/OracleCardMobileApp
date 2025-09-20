import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import '../../../../core/widgets/admin_appbar.dart';
import '../../../../core/widgets/custom_background.dart';
import '../../../../router/app_routes_names.dart';
import '../widgets/admin_dashboard_cart.dart';

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
                  onTap: () {
                    context.pushNamed(AppRoutesName.adminDeckAndCardsRoute);
                  },
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
