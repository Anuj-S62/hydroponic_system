
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hydroponic_system/screens/editscreen.dart';
import 'package:hydroponic_system/screens/mainscreen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hydroponic_system/screens/plantsscreen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    "high_importance_channel",
    "High Importance Notification",
  description: "This channel is used for notificatons",
  importance: Importance.high,
  playSound: true
);

int temp = 35;
bool flagW = true;
bool flagH = true;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async{
  await Firebase.initializeApp();
  print('message : ${message.messageId}');
}

Future<void> check(int t) async {
  final databaseReference  = FirebaseDatabase.instance.ref();
  if(t>35){
    await databaseReference.update({"systemState":0});
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  const AndroidInitializationSettings initializationSettingsAndroid =  AndroidInitializationSettings('app_icon');

  final InitializationSettings initializationSettings =
  InitializationSettings(
      android: initializationSettingsAndroid);
  flutterLocalNotificationsPlugin.initialize(initializationSettings);


  await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true
  );





  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'sans'),
    debugShowCheckedModeBanner: false,
    home: Home(),
    // initialRoute: '/main',
    routes: {
      '/main':(context) => GetStream(const {}),
      '/edit' : (context) => EditScreen(const {}),
      // '/setting' : (context) => Detail()
    },
  ));
}


class Home extends StatefulWidget {

 Home({Key? key}) : super(key: key);
  int pageIndex = 1;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int c = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message){
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if(notification!=null && android!=null){
        flutterLocalNotificationsPlugin.show(notification.hashCode, notification.title, notification.body, NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id!,
            channel.name,
            channelDescription: channel.description,
            color: Colors.green,
            playSound: true,
            icon: '@mipmap/ic_launcher',
          ),
        )
        );
      }

    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message){
      print('new message received');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if(notification!=null && android!=null){
        showDialog(context: context,
            builder: (_){
              return AlertDialog(
                title: Text(notification.title!),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notification.body!)
                    ],
                  ),
                ),
              );
            }
        );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    DatabaseReference ref = FirebaseDatabase.instance.ref();
    return StreamBuilder(
        stream: ref.onValue,
        builder: (BuildContext context, snap) {
          if (snap.hasData && !snap.hasError &&
              snap.data?.snapshot.value != null) {
            Map data = snap.data?.snapshot.value as Map;
            final screens = [EditScreen(data),GetStream(data),PlantsScreen(data)];
            check(data['cntWaterLevel']);
            if(data['cntWaterLevel']>temp){
              temp = data['cntWaterLevel'];
              flutterLocalNotificationsPlugin.show(0, "Water Level is Low", "System is currently OFF", NotificationDetails(
                android: AndroidNotificationDetails(
                  channel.id!,
                  channel.name,
                  // channel.description,
                  importance: Importance.high,
                  color: Colors.green,
                  playSound: true,
                  icon: '@mipmap/ic_launcher',
                ),
              )
              );
            }
            if(data['cntWaterLevel']<35){
              temp = 35;
            }
            if((data['surrtemp']=="nan" || data['humidity']=="nan") && flagH){
              flagH = false;
              flutterLocalNotificationsPlugin.show(1, "DHT22", "DHT22 is not working", NotificationDetails(
                android: AndroidNotificationDetails(
                  channel.id!,
                  channel.name,
                  // channel.description,
                  importance: Importance.high,
                  color: Colors.green,
                  playSound: true,
                  icon: '@mipmap/ic_launcher',
                ),
              ));
            }
            if(data['surrtemp']!="nan" && data['humidity']!="nan"){
              flagH = true;
            }
            double t = double.parse(data['waterTemp']);
            if(t==-127 && flagW){
              flagW = false;
              flutterLocalNotificationsPlugin.show(1, "Water Temp is not working", "System is currently OFF", NotificationDetails(
                android: AndroidNotificationDetails(
                  channel.id!,
                  channel.name,
                  // channel.description,
                  importance: Importance.high,
                  color: Colors.green,
                  playSound: true,
                  icon: '@mipmap/ic_launcher',
                ),
              ));
            }
            if(t!=-127){
              flagW = true;
            }
            // print(flagH);
            // print(flagW);
            // print(temp);
            return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                title: const Text("Smart Hydroponic System",
                  style: TextStyle(fontFamily: 'sans'),),
                backgroundColor: Colors.black,
                centerTitle: true,
              ),
              bottomNavigationBar: CurvedNavigationBar(

                height: 55,
                index: 1,
                color: Colors.white,
                backgroundColor: Colors.black,
                animationDuration: const Duration(milliseconds: 300),
                onTap: (index) {
                  setState(() {
                    widget.pageIndex = index;
                  });
                },
                items: const [
                  Icon(Icons.mode, size: 30,),
                  Icon(Icons.home, size: 30,),
                  Icon(Icons.forest_outlined, size: 30,)
                ],),
              body: screens[widget.pageIndex],
            );
          }
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              title: const Text("Smart Hydroponic System",
                style: TextStyle(fontFamily: 'sans'),),
              backgroundColor: Colors.black,
              centerTitle: true,
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: LoadingAnimationWidget.inkDrop(
                color: Colors.white,
                size: 80,
              ),
            ),
          );
        }
    );

  }
}
