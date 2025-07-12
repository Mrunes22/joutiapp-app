
import 'package:flutter/material.dart';
import '../screens/chat_list_screen.dart';

class MessagesScreen extends StatelessWidget {
  static const routeName = '/messages';
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    // Redirige vers ChatListScreen
    return const ChatListScreen();
  }
}
