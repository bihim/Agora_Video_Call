import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:get/get.dart';
import 'package:video_call/controller/videoController.dart';

class VideoCallScreen extends StatelessWidget {
  VideoController videoController = Get.put(VideoController());

  //const VideoCall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is video test"),
      ),
      body: Stack(
        children: [
          Center(
            child: _renderLocalPreview(),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              height: 200,
              width: 150,
              child: Center(
                child: _renderRemoteVideo(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderRemoteVideo() {
    return RtcLocalView.SurfaceView();
  }

  Widget _renderLocalPreview() {
    if (videoController.remoteUid.value != 0) {
      return RtcRemoteView.SurfaceView(
        uid: videoController.remoteUid.value,
      );
    } else {
      return Text(
        "Please wait remote user to join",
        textAlign: TextAlign.center,
      );
    }
  }
}
