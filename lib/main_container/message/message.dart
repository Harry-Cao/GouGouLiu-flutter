import 'package:flutter/material.dart';
import 'package:gougouliu_flutter/database/database.dart';
import 'package:gougouliu_flutter/database/extension/database_message.dart';
import 'package:gougouliu_flutter/main_container/message/model/message_model.dart';
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
                final (messageModel, user) = viewModel.getCellData(index);
                return MessageCell(
                  messageModel: messageModel,
                  user: user,
                );
              },
            );
          },
        ),
        floatingActionButton: IconButton(
            onPressed: () {
              MessageModel model = MessageModel(userId: "17137323356473014");
              DataBase.shared.addMessage(model);
            },
            icon: const Icon(Icons.add)),
      ),
    );
  }
}
