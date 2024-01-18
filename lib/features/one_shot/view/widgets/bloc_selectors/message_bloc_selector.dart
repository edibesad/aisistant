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
          selector: (state) => state.message,
          builder: (context, state) {
            return SelectionArea(
              child: MarkdownBlock(
                config: MarkdownConfig(configs: [
                  PreConfig(
                    textStyle: GoogleFonts.cutiveMono(fontSize: 16),
                  )
                ]),
                selectable: true,
                data: state,
              ),
            );
          },
        );
}
