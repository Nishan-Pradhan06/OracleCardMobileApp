import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/core/di/dependency_injection.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';
import 'package:oracle_card_app/features/admin/deck_and_card/bloc/get_admin_deck/get_admin_deck_bloc.dart';
import '../../../../core/widgets/admin_appbar.dart';
import '../../../../core/widgets/custom_simmer_loader.dart';
import '../../../../router/app_routes_names.dart';
import '../../dashboard/widgets/card_widget.dart';
import '../../dashboard/widgets/custom_btn_ad.dart';

class DeckAndCardScreen extends StatelessWidget {
  const DeckAndCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminCustomAppBar(title: 'Deck & Cards'),
      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {
            sl<GetAdminDeckBloc>().add(GetAdminDeckEvent.getAdminDeck());
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: CustomPadding(
              child: Column(
                spacing: 10,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Decks',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              color: Color(0xFF6B48FF),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      CustomBtnAdmin(
                        btnText: 'Create Deck',
                        onPressed: () {
                          context.pushNamed(
                            AppRoutesName.adminCreateDeckDialogRoute,
                          );
                        },
                      ),
                    ],
                  ),
                  BlocBuilder<GetAdminDeckBloc, GetAdminDeckState>(
                    builder: (context, state) {
                      return state.when(
                        initial: () => const SizedBox(height: 100),
                        loading: () => ShimmerLoaderWidget(
                          isList: true,
                          height: 40,
                          count: 2,
                          spacing: 10,
                        ),
                        failure: (failure) => SizedBox(
                          height: 100,
                          child: Center(
                            child: Text(
                              'Error: ${failure.message}',
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                        loaded: (data) {
                          final reversedData = data.reversed.toList();
                          return Column(
                            children: List.generate(reversedData.length, (
                              index,
                            ) {
                              final deckList = reversedData[index];
                              return AdminCardWidget(
                                cardTitle: deckList.name,
                                cardSubtitle: deckList.description,
                              );
                            }),
                          );
                        },
                      );
                    },
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Cards',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              color: Color(0xFF6B48FF),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      CustomBtnAdmin(btnText: 'Create Cards', onPressed: () {}),
                    ],
                  ),
                  Column(
                    children: List.generate(3, (index) {
                      return AdminCardWidget(
                        cardTitle: 'Angel Tarot',
                        cardSubtitle: '78 cards for spiritual guidance',
                      );
                    }),
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
