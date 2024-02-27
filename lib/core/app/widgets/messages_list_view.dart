import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app/models/gemini/gemini_request.dart';
import '../../../../../core/app/widgets/custom_markdown.dart';
import '../../../../../core/app/widgets/message_container.dart';
import '../../../../../core/extension/context_extension.dart';
import '../../../features/chat/chat_view/view/widgets/message_waiting_selector.dart';
import '../../base/base_cubit.dart';

class MessagesListView<T extends BaseCubit<U>, U extends Equatable>
    extends BlocSelector<T, U, List<Content>> {
  MessagesListView(
      {super.key,
      this.scrollController,
      required this.selectorCallback,
      required this.loadingSelectorCallback})
      : super(
            selector: selectorCallback,
            builder: (context, state) {
              return ListView.builder(
                shrinkWrap: true,
                controller: scrollController,
                itemCount: state.length,
                itemBuilder: (context, index) {
                  final Content message = state[index];
                  if (index == state.length - 1) {
                    return Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: context.height * .01),
                            child: MessageContainer(
                              role: message.role!,
                              content: CustomMarkdown(
                                  message.parts!.map((e) => e.text).join('\n')),
                            )),
                        MessageWaitinSelector<T, U>(
                          selectorCallback: loadingSelectorCallback,
                        )
                      ],
                    );
                  }
                  return Padding(
                    padding: EdgeInsets.only(top: context.height * .01),
                    child: MessageContainer(
                        role: message.role!,
                        content: CustomMarkdown(
                            message.parts!.map((e) => e.text).join('\n'))),
                  );
                },
              );
            });
  final ScrollController? scrollController;
  final List<Content> Function(U) selectorCallback;
  final bool Function(U) loadingSelectorCallback;
}
