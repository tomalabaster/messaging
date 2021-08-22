import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/message.dart';

class TextMessageIn extends StatelessWidget {
  final Message message;
  final bool firstInSet;
  final bool lastInSet;

  const TextMessageIn({
    Key? key,
    required this.message,
    this.firstInSet = false,
    this.lastInSet = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(this.firstInSet ? 10 : 2),
          topRight: Radius.circular(this.firstInSet ? 10 : 10),
          bottomLeft: Radius.circular(this.lastInSet ? 10 : 2),
          bottomRight: Radius.circular(this.lastInSet ? 10 : 10),
        ),
        color: Colors.grey.shade300,
      ),
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
      padding: const EdgeInsets.all(10),
      child: SelectableText(
        message.message ?? '',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
