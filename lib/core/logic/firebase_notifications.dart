

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_firebase_notifications/core/logic/helper_methods.dart';
import 'package:flutter_firebase_notifications/views/firebase_notifications/view.dart';

class FirebaseNotifications{

  //create instance of FBM
   final _firebaseMessaging = FirebaseMessaging.instance;

  //initialize FBM for app or device
   Future<void> initNotifications() async {
     await _firebaseMessaging.requestPermission();
     String? token=await _firebaseMessaging.getToken();
     print("Token $token");
     handleBackgroundNotification();
   }


   //handle notifications when recived
   void handleMessages(RemoteMessage? message){
     if(message == null) return;
     navigateTo(MNotificationsView(message: message,));
   }

   //handle notifications in case app termintaed
Future handleBackgroundNotification() async{
     FirebaseMessaging.instance.getInitialMessage().then(handleMessages);
     FirebaseMessaging.onMessageOpenedApp.listen(handleMessages);
}

}