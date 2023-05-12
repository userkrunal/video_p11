import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_p11/provider/vidoe_provider.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({Key? key}) : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {

  VideoProvider? vpT;
  VideoProvider? vpF;

  @override
  void initState() {
    super.initState();
    Provider.of<VideoProvider>(context,listen: false).loadvideo();
  }

  @override
  Widget build(BuildContext context) {
    vpF=Provider.of<VideoProvider>(context,listen: false);
    vpT=Provider.of<VideoProvider>(context,listen: true);
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Chewie(controller: vpF!.chewieController!)),
    ));
  }
}
