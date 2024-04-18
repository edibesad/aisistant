import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/base_cubit.dart';
import '../../extension/context_extension.dart';
import '../models/gemini/gemini_request.dart';
import 'messages_list_view.dart';
import 'prompt_text_field.dart';
import 'submit_button.dart';

class ChatBlocProvider<T extends BaseCubit<U>, U extends Equatable>
    extends StatelessWidget {
  const ChatBlocProvider(
      {super.key,
      required this.create,
      this.title,
      required this.selectorCallBack,
      required this.scrollController,
      required this.onSubmitted,
      required this.textEditingController,
      required this.loadingSelectorCallback,
      required this.onButtonPressed});
  final Widget? title;
  final List<Content> Function(U) selectorCallBack;
  final T Function(BuildContext) create;
  final ScrollController scrollController;
  final void Function(String) onSubmitted;
  final TextEditingController textEditingController;
  final void Function() onButtonPressed;
  final bool Function(U) loadingSelectorCallback;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<T>(
      create: create,
      child: Scaffold(
        appBar: context.mediaQuery.orientation == Orientation.portrait
            ? AppBar(
                title: title,
              )
            : null,
        body: BlocListener<T, U>(
          listener: (context, state) {},
          child: Padding(
            padding: context.paddingLow,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: MessagesListView<T, U>(
                        loadingSelectorCallback: loadingSelectorCallback,
                        selectorCallback: selectorCallBack,
                        scrollController: scrollController),
                  )),
                  LayoutBuilder(
                      builder: (context, constraints) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: constraints.maxWidth * .8,
                                child: PromptTextField(
                                  onSubmitted: onSubmitted,
                                  controller: textEditingController,
                                ),
                              ),
                              SizedBox(
                                  width: MediaQuery.of(context).orientation ==
                                          Orientation.portrait
                                      ? constraints.maxWidth * .16
                                      : constraints.maxWidth * .08,
                                  height: MediaQuery.of(context).orientation ==
                                          Orientation.portrait
                                      ? constraints.maxWidth * .16
                                      : constraints.maxWidth * .08,
                                  child: SubmitButton(
                                    onPressed: onButtonPressed,
                                  ))
                            ],
                          ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
