import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/widgets/admin_appbar.dart';
import '../../../../core/widgets/custom_background.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_toast.dart';
import '../../../../core/widgets/double_press_to_exit.dart';
import '../../../../router/app_routes_names.dart';
import '../../../auth/blocs/sign_out/sign_out_bloc.dart';
import '../../sessions/screen/session_screen.dart';
import '../widgets/admin_dashboard_cart.dart';

class AdminDasboardScreen extends StatelessWidget {
  const AdminDasboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminCustomAppBar(title: 'Admin Dashboard'),
      body: DoubleBackToExit(
        child: CustomBackground(
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
                    onTap: () {
                      context.pushNamed(
                        AppRoutesName.adminMeditationsScreenRoute,
                      );
                    },
                  ),
                  AdminDashCardWdiget(
                    svgPath: 'assets/svg/sessions.svg',
                    title: 'Sessions',
                    subtitle: 'Manage group sessions',
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => const CreateSessionDialog(),
                      );
                    },
                  ),
                  AdminDashCardWdiget(
                    svgPath: 'assets/svg/idea.svg',
                    title: 'Daily Guidance',
                    subtitle: 'Manage daily guidance',
                    onTap: () {
                      context.pushNamed(
                        AppRoutesName.adminDailyGuidanceScreenRoute,
                      );
                    },
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
                  BlocConsumer<SignOutBloc, SignOutState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        loaded: (data) {
                          context.goNamed(AppRoutesName.loginScreenRoute);
                          CustomToast.showSuccess('Signout Successfully!!!');
                        },
                        failure: (failure) {
                          CustomToast.showError(failure.message);
                        },
                      );
                    },
                    builder: (context, state) {
                      final bool isLoading = state.maybeWhen(
                        loading: () => true,
                        orElse: () => false,
                      );
                      return CustomButton(
                        isLoading: isLoading,
                        isDisabled: isLoading,
                        text: 'SignOut',
                        onPressed: isLoading
                            ? null
                            : () {
                                sl<SignOutBloc>().add(SignOutEvent.signOut());
                              },
                        leadingIcon: Icon(
                          Icons.exit_to_app_outlined,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
