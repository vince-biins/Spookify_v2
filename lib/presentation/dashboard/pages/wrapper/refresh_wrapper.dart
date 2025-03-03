import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spookify_v2/application/state/bloc/dashboard/launch/launch_bloc.dart';

class RefreshWrapper extends StatelessWidget {
  final Widget child;
  final Function(BuildContext context) refreshFunction;

  const RefreshWrapper({
    super.key,
    required this.child,
    required this.refreshFunction,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<LaunchBloc, int>(
      listener: (context, state) {
        refreshFunction(context);
      },
      child: child,
    );
  }
}
