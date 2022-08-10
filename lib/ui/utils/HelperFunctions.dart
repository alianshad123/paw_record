
import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions{
  static String spUserEmail="USEREMAIL";
  static String firebaseToken="FIREBASE_TOKEN";
  static String USER_TYPE="user_type";
  static String SITTER_EMAIL="sitter_email";
  static String USER_NAME="USER_NAME";


  static Future<bool> saveUserEmail(String email) async{
    SharedPreferences preferences= await SharedPreferences.getInstance();
    return await preferences.setString(spUserEmail, email);
  }

  static Future<bool> saveUserName(String name) async{
    SharedPreferences preferences= await SharedPreferences.getInstance();
    return await preferences.setString(USER_NAME, name);
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

  static Future<bool> saveSitterEmail(String email) async{
    SharedPreferences preferences= await SharedPreferences.getInstance();
    return await preferences.setString(SITTER_EMAIL, email);
  }

  ////

  /*static String?> getFirebaseToken() async {
    SharedPreferences preferences =await SharedPreferences.getInstance();
    return preferences.getString(firebaseToken);
  }*/
}