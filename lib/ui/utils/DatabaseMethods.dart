import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseMethods{
   getUserByUserName(String username) async{
      return await FirebaseFirestore.instance.collection("users")
          .where("name", isEqualTo: username)
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
}