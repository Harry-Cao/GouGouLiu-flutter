import 'package:flutter/material.dart';
import 'package:gougouliu_flutter/main_container/message/view/message_cell.dart';
import 'package:gougouliu_flutter/main_container/message/view_model/message_view_model.dart';
import 'package:gougouliu_flutter/modules/chat_room/chat_room_page.dart';
import 'package:provider/provider.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MessageViewModel>(
      create: (_) => MessageViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Message"),
        ),
        body: Consumer<MessageViewModel>(
          builder: (context, viewModel, child) {
            return ListView.builder(
              itemCount: viewModel.allMessages.length,
              itemBuilder: (context, index) {
                final (messageModel, user) = viewModel.getCellData(index);
                return MessageCell(
                  messageModel: messageModel,
                  user: user,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatRoomPage(
                        messageModel: messageModel,
                        user: user,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
