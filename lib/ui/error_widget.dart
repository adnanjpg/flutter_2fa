import 'package:flutter/material.dart';

// naming like this bcz there already a Widget named `ErrorWidget` in flutter
class ErrWidget extends StatelessWidget {
  const ErrWidget(this.error, this.stack, {super.key});

  const ErrWidget.error(this.error, {super.key}) : stack = null;

  const ErrWidget.empty({super.key})
      : error = '',
        stack = null;
  final Object? error;
  final StackTrace? stack;

  @override
  Widget build(BuildContext context) {
    final er = error?.toString() ?? '';

    if (er.isEmpty) {
      return Text(
        'An unknown error occurred',
        style: Theme.of(context).textTheme.headlineMedium,
      );
    }

    return Text(
      error.toString(),
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
