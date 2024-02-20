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

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.circle,
          color: _index % 3 == 0 ? Colors.grey : Colors.grey.shade300,
        ),
        Icon(
          Icons.circle,
          color: _index % 3 == 1 ? Colors.grey : Colors.grey.shade300,
        ),
        Icon(
          Icons.circle,
          color: _index % 3 == 2 ? Colors.grey : Colors.grey.shade300,
        )
      ],
    );
  }
}
