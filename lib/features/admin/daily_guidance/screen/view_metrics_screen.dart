import 'package:flutter/material.dart';
import 'package:oracle_card_app/core/widgets/custom_background.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';

import '../../../../core/widgets/admin_appbar.dart';

class GuidanceMetricsScreen extends StatelessWidget {
  final Map<String, dynamic> metricsData = {
    "success": true,
    "message": "Guidance metrics fetched",
    "data": {"delivered": 2, "opened": 2},
    "timestamp": "2025-11-15T05:37:08.877Z",
  };

  GuidanceMetricsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = metricsData['data'] as Map<String, dynamic>;
    final delivered = data['delivered'] as int;
    final opened = data['opened'] as int;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AdminCustomAppBar(
        title: 'Metrics Overview',
        automaticallyImplyLeading: true,
      ),
      body: CustomBackground(
        child: CustomPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Metrics Cards
              Row(
                children: [
                  Expanded(
                    child: _buildMetricCard(
                      icon: Icons.send_outlined,
                      title: 'Delivered',
                      value: delivered.toString(),
                      color: Colors.blue,
                      iconBackground: Colors.blue[50]!,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: _buildMetricCard(
                      icon: Icons.mark_email_read_outlined,
                      title: 'Opened',
                      value: opened.toString(),
                      color: Colors.purple,
                      iconBackground: Colors.purple[50]!,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24),

              // Timestamp
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Row(
                  children: [
                    Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                    SizedBox(width: 8),
                    Text(
                      'Last updated: ${_formatTimestamp(metricsData['timestamp'])}',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
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

  String _formatTimestamp(String timestamp) {
    final dateTime = DateTime.parse(timestamp);
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
