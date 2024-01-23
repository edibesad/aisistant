import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markdown_widget/config/all.dart';
import 'package:markdown_widget/widget/all.dart';

import '../../../view_model/one_shot_view_model.dart';
import '../../../view_model/state/one_shot_state.dart';

class MessageBlocSelector
    extends BlocSelector<OneShotViewModel, OneShotState, String> {
  MessageBlocSelector({super.key})
      : super(
          selector: (OneShotState state) => state.message,
          builder: (BuildContext context, String state) {
            final bool isDark = Theme.of(context).brightness == Brightness.dark;
            return SelectionArea(
              child: MarkdownBlock(
                config: MarkdownConfig(
                  configs: <WidgetConfig>[
                    if (isDark)
                      PreConfig.darkConfig.copy(
                        textStyle: GoogleFonts.cutiveMono(fontSize: 16),
                      )
                    else
                      const PreConfig().copy(
                        textStyle: GoogleFonts.cutiveMono(fontSize: 16),
                      ),
                  ],
                ),
                data: state.tr(),
              ),
            );
          },
        );
}
