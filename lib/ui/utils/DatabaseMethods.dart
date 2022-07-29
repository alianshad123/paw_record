

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{
   getUserByUserName(String username){

   }

   uploadUserInfo(usermap){
      FirebaseFirestore.instance.collection("users")
          .add(usermap).catchError((e){
             print(e.toString());
      });
   }
}