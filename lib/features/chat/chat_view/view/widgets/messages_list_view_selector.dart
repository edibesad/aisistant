// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../../core/app/models/gemini/gemini_request.dart';
// import '../../../../../core/app/widgets/custom_markdown.dart';
// import '../../../../../core/app/widgets/message_container.dart';
// import '../../../../../core/extension/context_extension.dart';
// import '../../view_model/chat_view_model.dart';
// import '../../view_model/state/chat_state.dart';
// import 'message_waiting_selector.dart';

// class MessagesListView
//     extends BlocSelector<ChatViewModel, ChatState, List<Content>> {
//   MessagesListView({super.key})
//       : super(
//             selector: (state) => state.messages,
//             builder: (context, state) {
//               return ListView.builder(
//                 shrinkWrap: true,
//                 controller: context.read<ChatViewModel>().scrollController,
//                 itemCount: state.length,
//                 itemBuilder: (context, index) {
//                   final Content message = state[index];
//                   if (index == state.length - 1) {
//                     return Column(
//                       children: [
//                         Padding(
//                             padding: EdgeInsets.only(top: context.height * .01),
//                             child: MessageContainer(
//                               role: message.role!,
//                               content: CustomMarkdown(
//                                   message.parts!.map((e) => e.text).join('\n')),
//                             )),
//                         MessageWaitinSelector()
//                       ],
//                     );
//                   }
//                   return Padding(
//                     padding: EdgeInsets.only(top: context.height * .01),
//                     child: MessageContainer(
//                         role: message.role!,
//                         content: CustomMarkdown(
//                             message.parts!.map((e) => e.text).join('\n'))),
//                   );
//                 },
//               );
//             });
// }
