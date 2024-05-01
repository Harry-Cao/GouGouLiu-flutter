import 'package:flutter/material.dart';
import 'package:gougouliu_flutter/main_container/message/view/message_cell.dart';
import 'package:gougouliu_flutter/main_container/message/view_model/message_view_model.dart';
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
                return MessageCell(messageModel: viewModel.allMessages[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
