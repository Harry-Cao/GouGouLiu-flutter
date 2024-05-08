import 'package:flutter/material.dart';
import 'package:gougouliu_flutter/extension/widget_extension.dart';

class ChatRoomInputView extends StatelessWidget {
  final String inputText;
  final void Function(String text) onChanged;
  final void Function() onTapSendButton;

  const ChatRoomInputView({
    super.key,
    required this.inputText,
    required this.onTapSendButton,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: TextField(
                controller: TextEditingController(text: inputText),
                onChanged: onChanged,
                decoration: const InputDecoration(
                  hintText: 'Type a message',
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              onPressed: onTapSendButton,
              icon: const Icon(Icons.send),
            ),
          ],
        ).padding(left: 12, right: 12, top: 12, bottom: 12),
      ),
    );
  }
}
