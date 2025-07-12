
import 'package:flutter/material.dart';
import 'chat_screen.dart';

class ConversationScreen extends StatelessWidget {
  static const routeName = '/conversation';
  const ConversationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    // Redirige vers ChatScreen
    return const ChatScreen();
  }
}
