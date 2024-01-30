import 'package:flutter/material.dart';

import '../../extension/context_extension.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: context.width,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Padding(
          padding: context.paddingLow,
          child: child,
        ),
      ),
    );
  }
}
