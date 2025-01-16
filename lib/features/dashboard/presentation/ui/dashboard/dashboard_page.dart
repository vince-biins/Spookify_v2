import 'package:flutter/material.dart';
import 'package:spookify_v2/core/assets/core_strings.dart';

import 'package:spookify_v2/features/dashboard/presentation/widgets/category_tile.dart';
import 'package:spookify_v2/features/dashboard/presentation/widgets/section_tile.dart';

part 'dashboard_content.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(CoreStrings.appName),
      ),
      body: const SingleChildScrollView(
        child: _DashboardContent(),
      ),
    );
  }
}
