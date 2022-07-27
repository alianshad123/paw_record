import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:paw_record/model/Message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> messages = [
    Message("Hi", DateTime.now().subtract(Duration(minutes: 1)), false),
    Message("Hi", DateTime.now().subtract(Duration(minutes: 1)), true),
    Message("How r u", DateTime.now().subtract(Duration(minutes: 1)), false),
    Message("fine ", DateTime.now().subtract(Duration(minutes: 1)), true),
    Message("Whatsap", DateTime.now().subtract(Duration(minutes: 1)), false),
  ].reversed.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Column(
        children: [
          Expanded(
              child: GroupedListView<Message, DateTime>(
                  padding: const EdgeInsets.all(8),
                  reverse: true,
                  order: GroupedListOrder.DESC,
                  useStickyGroupSeparators: true,
                  floatingHeader: true,
                  elements: messages,
                  groupBy: (message) => DateTime(
                    message.date.year,
                    message.date.month,
                    message.date.day
                  ),
                  groupHeaderBuilder: (Message message) => SizedBox(
                    height: 40,
                    child: Card(
                      color: Theme.of(context).primaryColor,
                        child: Text(
                          DateFormat.yMMMd().format(message.date),
                          style: const TextStyle(color: Colors.white),
                        ),
                    ),
                  ),
                  itemBuilder: (context, Message message) => Align(
                        alignment: message.isSendByMe
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Card(
                          elevation: 8,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(message.text),
                          ),
                        ),
                      ))),
          Container(
            color: Colors.grey.shade300,
            child: TextField(
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(12),
                  hintText: "Type your message here..."),
              onSubmitted: (text) {
                final message =Message(text, DateTime.now(), true);
                setState( ()=>messages.add(message));
              },
            ),
          )
        ],
      ),
    );
  }
}
