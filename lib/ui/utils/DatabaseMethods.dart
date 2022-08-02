import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseMethods{
   getUserByUserName(String username) async{
      return await FirebaseFirestore.instance.collection("users")
          .where("name", isEqualTo: username)
          .get();
   }
   getUserByEmail(String email) async{
      return await FirebaseFirestore.instance.collection("users")
          .where("email", isEqualTo: email)
          .get();
   }


   uploadUserInfo(usermap){
      FirebaseFirestore.instance.collection("users")
          .add(usermap).catchError((e){
             print(e.toString());
      });
   }

   createChatRoom(String chatRoomId, chatRoomMap){
      FirebaseFirestore.instance.collection("ChatRoom")
          .doc(chatRoomId).set(chatRoomMap).catchError((e){
             print(e.toString());
      });
   }

   addConversationMessages(String chatRoomId, messageMap){
      FirebaseFirestore.instance.collection("ChatRoom")
          .doc(chatRoomId)
          .collection("chats")
          .add(messageMap).catchError((e){print(e.toString());});
   }

   getConversationMessages(String chatRoomId) async{
     return await FirebaseFirestore.instance.collection("ChatRoom")
          .doc(chatRoomId)
          .collection("chats")
          .orderBy("time",descending: false)
          .snapshots();
   }
}