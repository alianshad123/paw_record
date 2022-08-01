
import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions{
  static String spUserEmail="USEREMAIL";


  static Future<bool> saveUserEmail(String email) async{
    SharedPreferences preferences= await SharedPreferences.getInstance();
    return await preferences.setString(spUserEmail, email);
  }

  ////

static Future<String?> getUserEmail() async {
    SharedPreferences preferences =await SharedPreferences.getInstance();
    return await preferences.getString(spUserEmail);
}
}