
import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions{
  static String spUserEmail="USEREMAIL";
  static String firebaseToken="FIREBASE_TOKEN";
  static String USER_TYPE="user_type";


  static Future<bool> saveUserEmail(String email) async{
    SharedPreferences preferences= await SharedPreferences.getInstance();
    return await preferences.setString(spUserEmail, email);
  }

  ////

static Future<String?> getUserEmail() async {
    SharedPreferences preferences =await SharedPreferences.getInstance();
    return await preferences.getString(spUserEmail);
}

  static Future<bool> saveFirebaseToken(String token) async{
    SharedPreferences preferences= await SharedPreferences.getInstance();
    return await preferences.setString(firebaseToken, token);
  }

  static Future<bool> saveUserType(String userType) async{
    SharedPreferences preferences= await SharedPreferences.getInstance();
    return await preferences.setString(USER_TYPE, userType);
  }

  ////

  /*static String?> getFirebaseToken() async {
    SharedPreferences preferences =await SharedPreferences.getInstance();
    return preferences.getString(firebaseToken);
  }*/
}