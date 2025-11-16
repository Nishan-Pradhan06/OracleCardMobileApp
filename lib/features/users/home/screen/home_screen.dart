import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_card_app/core/di/dependency_injection.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_refresh_indicator.dart';
import 'package:oracle_card_app/core/widgets/custom_toast.dart';
import 'package:oracle_card_app/features/users/home/bloc/get_daily_guidance/get_daily_guidance_bloc.dart';
import 'package:oracle_card_app/features/users/home/bloc/get_oracle_pull_status_bloc/get_oracle_pull_status_bloc.dart';
import 'package:oracle_card_app/router/app_routes_names.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_padding.dart';
import '../../../../core/widgets/custom_simmer_loader.dart';
import '../../../../core/widgets/upgrade_premium_button_widget.dart';
import '../../../../core/widgets/user_plan_type_widget.dart';
import '../../journal/bloc/get_journal_entires_list/get_journal_entires_list_bloc.dart';
import '../../profile/bloc/get_user_profile/user_profile_bloc.dart';
import '../models/home_container_model.dart';
import '../widgets/custom_card_button.dart';
import '../../../../core/widgets/custom_container.dart';
import '../widgets/home_container.dart';
import '../widgets/notification_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    sl<GetJournalEntiresListBloc>().add(
      GetJournalEntiresListEvent.getJournalEntiresList(),
    );
    sl<UserProfileBloc>().add(UserProfileEvent.getUserProfile());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Oracle Card App',
        automaticallyImplyLeading: false,
        titleAlignment: TitleAlignment.left,
        actions: [NotificationIcon(), UserPlanTypeWidget()],
      ),
      body: CustomBackground(
        child: CustomRefreshIndicator(
          onRefresh: () async {
            sl<GetDailyGuidanceBloc>().add(
              GetDailyGuidanceEvent.getDailyGuidance(),
            );

            sl<GetOraclePullStatusBloc>().add(
              GetOraclePullStatusEvent.getOracleCardPullStatus(),
            );
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),

            child: CustomPadding(
              child: Column(
                spacing: 20,
                children: [
                  CustomContainer(
                    isGradient: true,
                    showSvgOverlay: true,
                    useIntrinsicHeight: true,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 10,
                        children: [
                          Text(
                            'Today\'s Oracle',
                            style: Theme.of(context).textTheme.displaySmall
                                ?.copyWith(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            'Tap to reveal your message',
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(color: Colors.white, fontSize: 18),
                          ),
                          BlocConsumer<
                            GetOraclePullStatusBloc,
                            GetOraclePullStatusState
                          >(
                            listener: (context, state) {
                              state.whenOrNull(
                                loaded: (data) {
                                  CustomToast.showSuccess("dsfsdnsd");
                                },
                              );
                            },
                            builder: (context, state) {
                              return state.when(
                                initial: () => const SizedBox(height: 100),
                                loading: () => const SizedBox(
                                  height: 45,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15.0,
                                    ),
                                    child: ShimmerLoaderWidget(
                                      height: 45,
                                      baseColor: Color(0xFF6790ff),
                                      highlightColor: Color(0xFF4da0ff),
                                    ),
                                  ),
                                ),
                                failure: (failure) => Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15.0,
                                  ),
                                  child: ShimmerLoaderWidget(
                                    height: 45,
                                    baseColor: Color(0xFF6790ff),
                                    highlightColor: Color(0xFF4da0ff),
                                  ),
                                ),
                                loaded: (data) {
                                  return CustomCardButton(
                                    leading: SvgPicture.asset(
                                      'assets/svg/shuffle.svg',
                                      height: 15,
                                      width: 15,
                                      colorFilter: const ColorFilter.mode(
                                        Colors.white,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    action: Text(
                                      '${data.remaining}/${data.remaining}',
                                      // '0/1',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(color: Colors.white),
                                    ),
                                    text: "Random Pull",
                                    onPressed: data.remaining > 0
                                        ? () {
                                            sl<GetOraclePullStatusBloc>().add(
                                              GetOraclePullStatusEvent.getOracleCardPullStatus(),
                                            );
                                          }
                                        : null,
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  BlocBuilder<GetDailyGuidanceBloc, GetDailyGuidanceState>(
                    builder: (context, state) {
                      return state.when(
                        initial: () => const SizedBox(height: 100),

                        loading: () => const SizedBox(
                          height: 100,
                          child: ShimmerLoaderWidget(),
                        ),
                        failure: (failure) =>
                            SizedBox(height: 100, child: ShimmerLoaderWidget()),
                        loaded: (data) {
                          return CustomContainer(
                            onTap: () {
                              context.pushNamed(
                                AppRoutesName.dailyGuidanceScreenRoute,
                              );
                            },
                            height: MediaQuery.sizeOf(context).height / 3.8,
                            useIntrinsicHeight: true,
                            padding: EdgeInsetsGeometry.only(
                              top: 20,
                              left: 20,
                              right: 20,
                              bottom: 10,
                            ),
                            isGradient: false,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 10,
                              children: [
                                Text(
                                  data.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  data.message,
                                  style: Theme.of(context).textTheme.bodyLarge
                                      ?.copyWith(
                                        fontSize: 20,
                                        color: Color(
                                          0xFF333333,
                                        ).withValues(alpha: 0.7),
                                      ),
                                ),
                                data.hasAudio == true
                                    ? Container(
                                        height: 70,
                                        padding: EdgeInsets.all(10),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          color: Color(0xFFF5F5F5),
                                        ),
                                        child: Row(
                                          spacing: 10,
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(
                                                  data.hasAudio
                                                      ? 0xFF6B48FF
                                                      : 0xFFE0E0E0,
                                                ),
                                              ),
                                              child: Icon(
                                                Icons.play_arrow_rounded,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                            ),
                                            Expanded(
                                              child: LinearProgressIndicator(
                                                color: Color(0xFF6B48FF),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                backgroundColor: Color(
                                                  0xFFE0E0E0,
                                                ),
                                                value: 10,
                                              ),
                                            ),
                                            Text('0:00'),
                                          ],
                                        ),
                                      )
                                    : SizedBox.shrink(),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),

                    shrinkWrap: true,
                    itemCount: homeItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          childAspectRatio: 1,
                        ),
                    itemBuilder: (context, index) {
                      final item = homeItems[index];
                      return GridContainer(
                        svgUrl: item.svgUrl,
                        title: item.title,
                        description: item.description,
                      );
                    },
                  ),
                  UserPlanTypeWidget(
                    freePlan: UpgradePremiumButtonWidget(),
                    paidPlan: SizedBox.shrink(),
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


    // BlocConsumer<
    //                 ,
    //                 GetOraclePullStatusState
    //               >(
    //                 listener: (context, state) {
    //                   state.whenOrNull(
    //                     loaded: (data) {
    //                       CustomToast.showSuccess(
    //                         "Pull status fetched successfully",
    //                       );
    //                     },
    //                   );
    //                 },
    //                 builder: (context, state) {
    //                   return state.when(
    //                     initial: () => const SizedBox(height: 100),

    //                     loading: () => const SizedBox(
    //                       height: 100,
    //                       child: ShimmerLoaderWidget(),
    //                     ),
    //                     failure: (failure) => SizedBox(
    //                       height: 100,
    //                       child: Center(
    //                         child: Text(
    //                           'Error: ${failure.message}',
    //                           style: const TextStyle(color: Colors.red),
    //                         ),
    //                       ),
    //                     ),

    //                     loaded: (data) {