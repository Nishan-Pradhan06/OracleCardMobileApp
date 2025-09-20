import 'package:flutter/material.dart';
import 'package:oracle_card_app/core/widgets/custom_padding.dart';

class AdminDasboardScreen extends StatelessWidget {
  const AdminDasboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPadding(
        child: SingleChildScrollView(child: Column(children: [])),
      ),
    );
  }
}
