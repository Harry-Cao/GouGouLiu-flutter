import 'package:flutter/material.dart';
import 'package:gougouliu_flutter/main_container/message/model/message_model.dart';
import 'package:gougouliu_flutter/manager/user_manager/model/user_model.dart';
import 'package:gougouliu_flutter/modules/chat_room/view/chat_room_cell.dart';
import 'package:gougouliu_flutter/modules/chat_room/view/chat_room_input_view.dart';
import 'package:gougouliu_flutter/modules/chat_room/view_model/chat_room_view_model.dart';
import 'package:provider/provider.dart';

class ChatRoomPage extends StatefulWidget {
  final MessageModel messageModel;
  final UserModel? user;
  const ChatRoomPage(
      {super.key, required this.messageModel, required this.user});

  @override
  State<StatefulWidget> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  late ChatRoomViewModel viewModel = ChatRoomViewModel(widget.messageModel);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => viewModel.scrollToBottom(animate: false));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.user?.userName ?? ""),
        ),
        body: Consumer<ChatRoomViewModel>(
          builder: (context, viewModel, child) => Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: viewModel.scrollController,
                  itemCount: widget.messageModel.messages.length,
                  itemBuilder: (context, index) {
                    final (chatModel, user) = viewModel.getCellData(index);
                    return ChatRoomCell(
                      chatModel: chatModel,
                      user: user,
                    );
                  },
                ),
              ),
              ChatRoomInputView(
                inputText: viewModel.inputText,
                onChanged: (text) => viewModel.onInputTextChanged(text),
                onTapSendButton: viewModel.sendMessage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
