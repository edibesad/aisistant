import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../extension/context_extension.dart';

class CustomMarkdown extends StatelessWidget {
  const CustomMarkdown(this.message, {super.key});

  final String? message;
  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SelectionArea(
      child: MarkdownBody(
        styleSheet: MarkdownStyleSheet(
            code: TextStyle(
              fontFamily: GoogleFonts.cutiveMono().fontFamily,
              fontSize: MediaQuery.of(context).textScaler.scale(16),
              color: isDark ? Colors.white : Colors.black,
            ),
            p: TextStyle(
                fontSize: MediaQuery.of(context).textScaler.scale(18),
                color: context.themeData.brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black)),
        data: message ?? '',
      ),
    );
  }
}
