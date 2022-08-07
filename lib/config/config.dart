

import 'package:shared_preferences/shared_preferences.dart';

class EcommerceApp {
  static const String appName = 'fyp-1';

static String SharedPreferences="shareprefences" ;
 //static  User?  user;
 static String FirebaseUser="users" ;
 static String firebaseauth="auth";
 static String firestore="store";

  static String collectionUser = "users";
  static String collectionOrders = "orders";
  static String userCartList = 'userCart';
  static String subCollectionAddress = 'userAddress';

  static final String userName = 'name';
  static final String userEmail = 'email';
  static final String userPhotoUrl = 'photoUrl';
  static final String userUID = 'uid';
  static final String userAvatarUrl = 'url';

  static final String addressID = 'addressID';
  static final String totalAmount = 'totalAmount';
  static final String productID = 'productIDs';
  static final String paymentDetails ='paymentDetails';
  static final String orderTime ='orderTime';
  static final String isSuccess ='isSuccess';


}