import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:spookify_v2/presentation/theme/app_colors.dart';

class CustomLoadingImageIndicator extends StatelessWidget {
  final double size;
  const CustomLoadingImageIndicator({super.key, this.size = 20.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SpinKitDoubleBounce(
        color: AppColors.tertiary,
        size: size,
      ),
    );
  }
}
