import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../extension/context_extension.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      color: context.theme.colorScheme.onTertiary,
      onPressed: onPressed,
      icon: LayoutBuilder(
        builder: (context, constraints) => Icon(
          FontAwesomeIcons.solidPaperPlane,
          size: constraints.maxWidth * .6,
        ),
      ),
    );
  }
}
