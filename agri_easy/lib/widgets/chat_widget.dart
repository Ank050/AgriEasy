import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:agri_easy/constants/constants.dart';
import 'package:agri_easy/services/assets_manager.dart';
import 'package:flutter/material.dart';

import 'text_widget.dart';

class ChatWidget extends StatelessWidget {
  final String msg;
  final int chatIndex;
  final bool shouldAnimate;

  const ChatWidget({
    Key? key,
    required this.msg,
    required this.chatIndex,
    this.shouldAnimate = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isUserChat = chatIndex == 0;
    final chatColor = isUserChat ? scaffoldBackgroundColor : textColor;
    final chatImage =
        isUserChat ? AssetsManager.userImage : AssetsManager.botImage;

    return Material(
      color: chatColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              chatImage,
              height: 30,
              width: 30,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: isUserChat ? TextWidget(label: msg) : _buildChatMessage(),
            ),
            if (!isUserChat) const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Widget _buildChatMessage() {
    if (shouldAnimate) {
      return DefaultTextStyle(
        style: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
        child: AnimatedTextKit(
          isRepeatingAnimation: false,
          repeatForever: false,
          displayFullTextOnTap: true,
          totalRepeatCount: 1,
          animatedTexts: [
            TyperAnimatedText(
              msg.trim(),
            ),
          ],
        ),
      );
    } else {
      return Text(
        msg.trim(),
        style: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      );
    }
  }
}
