// 1
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_rx/core/domain/base/bloc_base.dart';

class BlocProvider<T extends BlocBase> extends StatefulWidget {
  final Widget child;
  final T create;

  BlocProvider({
    Key? key,
    required this.create,
    required this.child,
  }) : super(key: key);

  // 2
  static T of<T extends BlocBase>(BuildContext context) {
    final BlocProvider<T> provider = context.findAncestorWidgetOfExactType()!;
    return provider.create;
  }

  @override
  State createState() => _BlocProviderState();
}

class _BlocProviderState extends State<BlocProvider> {
  // 3
  @override
  Widget build(BuildContext context) => widget.child;

  // 4
  @override
  void dispose() {
    widget.create.dispose();
    super.dispose();
  }
}
