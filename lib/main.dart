import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text("Permission Handler"),),
        body: const HomeScreen(),
      ),
    );
  }
}


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: TextButton(onPressed: () {
      checkPermission(Permission.photos, context);
    }, child: Text("Check Permission")));
  }

  Future<void> checkPermission(Permission permission,
      BuildContext context) async {
    final status = await permission.request();

    if (status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Permission Is Granted")));
    } else {

      openAppSettings();
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Permission Is not Granted")));

      print("하이ㅇㅇㅇ");
    }
  }
}