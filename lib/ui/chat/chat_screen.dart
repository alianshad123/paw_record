import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:paw_record/model/Message.dart';
import 'package:paw_record/ui/utils/Constants.dart';
import 'package:paw_record/ui/utils/DatabaseMethods.dart';

class ChatScreen extends StatefulWidget {
  final String chatRoomId;
  const ChatScreen({Key? key, required this.chatRoomId}) : super(key: key);

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

  late ScrollController _scrollController;

  DatabaseMethods databaseMethods=DatabaseMethods();
  TextEditingController  messageController = TextEditingController();
  late Stream chatMessageStream;

  void scrollToBottom() {
    final bottomOffset = _scrollController.position.maxScrollExtent;
    _scrollController.animateTo(
      bottomOffset,
      duration: Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
  }

  Widget ChatMessageList(){
    return StreamBuilder(
      stream: chatMessageStream,
      builder: (context,snapshot){
        return snapshot.hasData ? ListView.builder(
            controller: _scrollController,
            itemCount: (snapshot.data as QuerySnapshot).docs.length,
            itemBuilder: (context,index){
            return MessageTile((snapshot.data as QuerySnapshot).docs[index]["message"],
                (snapshot.data as QuerySnapshot).docs[index]["sendBy"]==Constants.userEmail);
            }) : Container();

      },
    );
  }

  sendMessage(){
    if(messageController.text.isNotEmpty){
      Map<String,dynamic> messageMap= {
        "message" :messageController.text,
        "sendBy" :Constants.userEmail,
        "time" :DateTime.now().millisecondsSinceEpoch
      };
      databaseMethods.addConversationMessages(widget.chatRoomId,messageMap);
      messageController.text="";
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    databaseMethods.getConversationMessages(widget.chatRoomId).then((value){
      setState((){
        chatMessageStream =value;
      });
    });
    super.initState();

  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text("Chat",
              style: TextStyle(
                color: Colors.black,
              )),
          brightness: Brightness.light,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: ImageIcon(
              AssetImage("images/ic_back_btn.png"),
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
      body:Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child:
            Container(
              margin: const EdgeInsets.only(bottom: 10.0),
            child:ChatMessageList(),),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.white70,
                padding: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
                child: Row(
                  children: [
                    Expanded(child: TextField(
                      controller: messageController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: "Message..",
                        hintStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none
                      ),
                    )),
                    GestureDetector(
                      onTap: (){
                          sendMessage();
                          FocusManager.instance.primaryFocus?.unfocus();
                          scrollToBottom();
                      },
                        child:Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFFFFFFFF),
                                const Color(0xFFFFFFFF)
                              ]
                            ),
                            borderRadius: BorderRadius.circular(40)
                          ),
                          padding: EdgeInsets.all(12),
                          child: Icon(
                            Icons.send,
                            size: 15,
                            color: Colors.deepPurple,
                          )
                        )
                    ),


                  ],
                ),
              ),
            )
          ],
        ),
      )



      /* Column(
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
              controller: messageController,
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
      ),*/
    );
  }
}

class  MessageTile extends StatelessWidget {
  final String  message;
  final bool  isSendByMe;
  MessageTile(this.message,this.isSendByMe);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: isSendByMe ? 0: 24,right: isSendByMe ? 24 : 0),
      margin: EdgeInsets.symmetric(vertical:8),
      width: MediaQuery.of(context).size.width,
     alignment: isSendByMe ? Alignment.centerRight : Alignment.centerLeft,
     child: Container(
       padding: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
       decoration: BoxDecoration(
         gradient: LinearGradient(
           colors: isSendByMe ? [
             const Color(0xff7e00f4),
             const Color(0xff3a016e)]
             :[
             const Color(0xFC232323),
             const Color(0xFC494949)
             ]
         ),
         borderRadius: isSendByMe ?
             BorderRadius.only(
                topLeft: Radius.circular(23),
                    topRight: Radius.circular(23),
               bottomLeft: Radius.circular(23)
             ):
         BorderRadius.only(
             topLeft: Radius.circular(23),
             topRight: Radius.circular(23),
             bottomRight: Radius.circular(23)
         )
       ),
       child: Text(message,style: TextStyle(color: Colors.white,
       fontSize: 17)),
     )
    );
  }
}
