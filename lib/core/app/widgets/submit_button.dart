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
      icon: SizedBox(
          width: context.mediaQuery.size.width * .1,
          height: context.mediaQuery.size.width * .1,
          child: Icon(
            FontAwesomeIcons.solidPaperPlane,
            size: context.mediaQuery.size.width * .07,
          )),
    );
  }
}
