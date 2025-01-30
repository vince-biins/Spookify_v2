import 'package:flutter/material.dart';
import 'package:spookify_v2/features/dashboard/domain/model/dashboard_item.dart';
import 'package:spookify_v2/features/dashboard/presentation/ui/category/category_list_content.dart';

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
