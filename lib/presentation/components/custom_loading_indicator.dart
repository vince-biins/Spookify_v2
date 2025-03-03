import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:spookify_v2/presentation/theme/app_colors.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: SpinKitWave(
        color: AppColors.primary,
        size: 40.0,
      ),
    );
  }
}
