import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:spookify_v2/src/presentation/theme/app_colors.dart';

class DominantColorHelper {
  static Future<Color> getDominantColor(String imageUrl) async {
    try {
      final PaletteGenerator paletteGenerator =
          await PaletteGenerator.fromImageProvider(
        NetworkImage(imageUrl),
      );
      return paletteGenerator.dominantColor?.color ?? AppColors.primary;
    } catch (e) {
      return AppColors.primary;
    }
  }
}
