import 'package:bloc_project/constant/colors.dart';
import 'package:flutter/material.dart';

class BuildBrogressIndcator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.yellow,
      ),
    );
  }
}
