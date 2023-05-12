import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_p11/model/video_model.dart';
import 'package:video_player/video_player.dart';

class VideoProvider extends ChangeNotifier
{
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  int videoindex = 0;
  
  void loadvideo()
  {
    videoPlayerController=VideoPlayerController.asset("${videoList[videoindex].path}");
    videoPlayerController!.initialize();

    chewieController = ChewieController(
        videoPlayerController: videoPlayerController!,
        autoPlay: true,
        systemOverlaysAfterFullScreen: [SystemUiOverlay.bottom],
        materialProgressColors: ChewieProgressColors(
        backgroundColor: Colors.grey,
            playedColor: Colors.purple,
          handleColor: Colors.white
      )
    );
  }
  
  List videoList=[
    VideoModel(name: "Chogada",path: "assets/video/v1.mp4",img: "assets/images/img.png"),
    VideoModel(name: "Vaaste",path: "assets/video/v2.mp4",img: "assets/images/img_1.png"),
    VideoModel(name: "Dheere Dheere Se ",path: "assets/video/v3.mp4",img: "assets/images/img_2.png"),
    VideoModel(name: "Aksar Iss Duniya Mein",path: "assets/video/v4.mp4",img: "assets/images/img_3.png"),
    VideoModel(name: "Yaad Piya Ki Aane Lagi ",path: "assets/video/v5.mp4",img: "assets/images/img_4.png"),
    VideoModel(name: "Sanam Teri Kasam",path: "assets/video/v6.mp4",img: "assets/images/img_5.png"),
  ];

  void passindex(int index) {
    videoindex = index;
    notifyListeners();
  }
}