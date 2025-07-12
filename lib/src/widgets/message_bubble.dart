
import 'package:flutter/material.dart';
import '../config/constants.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isMine;

  const MessageBubble({
    Key? key,
    required this.text,
    required this.isMine,
  }) : super(key: key);

  @override
  Widget build(BuildContext c) => Align(
    alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isMine ? AppColors.accent.withOpacity(0.3) : AppColors.background,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(12),
          topRight: const Radius.circular(12),
          bottomLeft: Radius.circular(isMine ? 12 : 0),
          bottomRight: Radius.circular(isMine ? 0 : 12),
        ),
      ),
      child: Text(text, style: const TextStyle(color: AppColors.textPrimary)),
    ),
  );
}
