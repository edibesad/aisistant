import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/one_shot_view_model.dart';
import '../../../view_model/state/one_shot_state.dart';

class SubmitButtonBlocSelector
    extends BlocSelector<OneShotViewModel, OneShotState, bool> {
  SubmitButtonBlocSelector({super.key})
      : super(
          selector: (state) => state.isLoading,
          builder: (context, state) {
            return state
                ? const CircularProgressIndicator()
                : IconButton.filled(
                    onPressed: context.read<OneShotViewModel>().onButtonPressed,
                    icon: const Icon(Icons.send),
                  );
          },
        );
}
