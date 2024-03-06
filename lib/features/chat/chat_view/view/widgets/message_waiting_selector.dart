import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app/widgets/message_waiting_container.dart';
import '../../../../../core/base/base_cubit.dart';

class MessageWaitinSelector<T extends BaseCubit<U>, U extends Equatable>
    extends BlocSelector<T, U, bool> {
  MessageWaitinSelector({super.key, required this.selectorCallback})
      : super(
            selector: selectorCallback,
            builder: (context, state) {
              return state ? const MessageWaitingContainer() : const SizedBox();
            });
  final bool Function(U) selectorCallback;
}
