import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class VideoController extends GetxController{

  static const appID = "YourAppId";
  static const token = "YourTokenCode";
  var remoteUid = 0.obs;

  Future<void> initAgora() async{
    //permission
    await [Permission.camera, Permission.microphone].request();

    //RTC Engine
    var _rtcEngine = await RtcEngine.createWithConfig(RtcEngineConfig(appID));
    await _rtcEngine.enableVideo();

    _rtcEngine.setEventHandler(
      RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
          print("local user $uid joined");
        },
        userJoined: (int uid, int elapsed) {
          print("remote user $uid joined");
          remoteUid.value = uid;
        },
        userOffline: (int uid, UserOfflineReason reason) {
          print("remote user $uid left the channel");
          remoteUid.value = 0;
        },
      ),
    );
    await _rtcEngine.joinChannel(token, "YourChannelName", null, 0);
    
  }

  @override
  void onInit() {
    initAgora();
    super.onInit();
  }
}