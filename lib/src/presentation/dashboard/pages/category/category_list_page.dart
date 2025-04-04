import 'package:flutter/material.dart';
import 'package:spookify_v2/src/application/paramaters/dashboard_item.dart';
import 'package:spookify_v2/src/presentation/dashboard/pages/category/category_list_content.dart';

class CategoryListPage extends StatelessWidget {
  final List<DashboardItem> args;
  const CategoryListPage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CategoryListContent(args: args),
    );
  }
}
