import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/extension/context_extension.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .15,
      width: MediaQuery.of(context).size.width * .9,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            offset: Offset(-4, 10),
            blurStyle: BlurStyle.solid,
          )
        ],
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.amber,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Text(title, style: const TextStyle(fontSize: 36)).tr(),
        ],
      ),
    );
  }
}
