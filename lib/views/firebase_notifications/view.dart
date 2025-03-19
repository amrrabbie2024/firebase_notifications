import 'package:firebase_messaging_platform_interface/src/remote_message.dart';
import 'package:flutter/material.dart';

class MNotificationsView extends StatelessWidget {
  final RemoteMessage message;
  const MNotificationsView( {super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message.notification!.title.toString(),style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 24,fontWeight: FontWeight.bold),),
            SizedBox(height: 16,),
            Text(message.notification!.body.toString(),style: TextStyle(color: Colors.green,fontWeight: FontWeight.w500,fontSize: 21), )
          ],
        ),
      ),
    );
  }
}
