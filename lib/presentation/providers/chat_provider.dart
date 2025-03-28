

import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: "Hola", fromWhom: FromWhom.me),
    Message(text: "Ya regresaste del trabajo?", fromWhom: FromWhom.me),
  ];

  Future<void> sendMessage(String text) async {

    final newMessage = Message(text: text, fromWhom: FromWhom.me);
    if (text.trim().isEmpty) return;
    messageList.add(newMessage); 

    if (text.endsWith("?")) await herReply(text);

    notifyListeners();
    scrollToBottom();
  }

  Future<void> herReply(String text) async {

    final herMessage = await getYesNoAnswer.getAnswer();

    messageList.add(herMessage);

    notifyListeners();
    scrollToBottom();
    
    // return messageList.add(herMessage);
  }
  Future<void> scrollToBottom() async {

    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut
    );
  }


}