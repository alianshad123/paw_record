
import 'package:firebase_auth/firebase_auth.dart';
class AuthMethods {
  final  FirebaseAuth _auth=FirebaseAuth.instance;

  Future signInWithEmailAndPassword(String  email,String password) async {

    try{
     // UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();

      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser);
    }catch(e){
      print(e);
    }
  }

  User?  _userFromFirebaseUser(User? user) {
      return user;
  }

  Future signUpWithEmailAndPassword(String  email,String password) async {

    try{

      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser);


      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: password
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }




    }catch(e){
      print(e);
    }
  }
  Future signOut() async{
    try{
         return await _auth.signOut();
    }catch(e){
      print(e);
    }
  }
}
