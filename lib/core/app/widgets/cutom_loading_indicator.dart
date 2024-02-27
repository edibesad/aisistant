import 'dart:async';

import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatefulWidget {
  const CustomLoadingIndicator({super.key});

  @override
  State<CustomLoadingIndicator> createState() => _CustomLoadingIndicatorState();
}

class _CustomLoadingIndicatorState extends State<CustomLoadingIndicator> {
  int _index = 0;
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 150), (timer) {
      if (mounted) {
        setState(() {
          _index++;
        });
      }
    });
  }

  Color color = const Color.fromARGB(255, 47, 165, 255);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: 10,
          height: 10,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: _index % 3 == 0 ? color : color.withOpacity(.5),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: 10,
          height: 10,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: _index % 3 == 1 ? color : color.withOpacity(.3),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: 10,
          height: 10,
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: _index % 3 == 2 ? color : color.withOpacity(.5),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        // Icon(
        //   Icons.circle,
        //   color: _index % 3 == 0 ? color : color.withOpacity(.5),
        // ),
        // Icon(
        //   Icons.circle,
        //   color: _index % 3 == 1 ? color : color.withOpacity(.5),
        // ),
        // Icon(
        //   Icons.circle,
        //   color: _index % 3 == 2 ? color : color.withOpacity(.5),
        // )
      ],
    );
  }
}
