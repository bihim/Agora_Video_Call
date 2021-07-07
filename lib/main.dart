import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:video_call/view/VideoCallScreen.dart';

const appID = "a0c6ee30815249a5abbe6c2a970377ae";
const token =
    "006a0c6ee30815249a5abbe6c2a970377aeIAAmWqO0VyvGzM5ob74ztg2ELoBgvTwiCm/ZnIsozX/DwdzDPrsAAAAAEAAm+nFWeBfkYAEAAQB4F+Rg";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Video Calling App",
      theme: ThemeData(primarySwatch: Colors.green),
      home: VideoCallScreen(),
    );
  }
}
