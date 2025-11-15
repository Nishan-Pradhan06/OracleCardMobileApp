import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';
import 'package:oracle_card_app/features/admin/daily_guidance/bloc/guidance_metrics/guidance_metrics_bloc.dart';

import '../../../../core/widgets/admin_appbar.dart';
import '../../../../core/widgets/custom_simmer_loader.dart';

class GuidanceMetricsScreen extends StatelessWidget {
  final int guidanceId;
  const GuidanceMetricsScreen({super.key, required this.guidanceId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AdminCustomAppBar(
        title: 'Metrics Overview',
        automaticallyImplyLeading: true,
      ),
      body: CustomBackground(
        child: CustomPadding(
          child: BlocBuilder<GuidanceMetricsBloc, GuidanceMetricsState>(
            builder: (context, state) {
              return state.when(
                initial: () => const SizedBox(height: 100),
                loading: () => ShimmerLoaderWidget(
                  isList: false,
                  height: 60,
                  count: 5,
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
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Metrics Cards
                      Row(
                        children: [
                          Expanded(
                            child: _buildMetricCard(
                              icon: Icons.send_outlined,
                              title: 'Delivered',
                              value: data.delivered.toString(),
                              color: Colors.blue,
                              iconBackground: Colors.blue[50]!,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: _buildMetricCard(
                              icon: Icons.mark_email_read_outlined,
                              title: 'Opened',
                              value: data.opened.toString(),
                              color: Colors.purple,
                              iconBackground: Colors.purple[50]!,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMetricCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
    required Color iconBackground,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBackground,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              color: Colors.grey[900],
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
