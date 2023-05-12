import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:video_p11/provider/vidoe_provider.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoProvider? vpT;
  VideoProvider? vpF;

  @override
  Widget build(BuildContext context) {
    vpF=Provider.of<VideoProvider>(context,listen: false);
    vpT=Provider.of<VideoProvider>(context,listen: true);
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Video Player",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white)),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 1.5.h,
                width: 20.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade300
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'play');
                  vpF!.passindex(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 70.w,
                    width: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: AssetImage("${vpF!.videoList[index].img}"),fit: BoxFit.fill,opacity: 20)
                    ),
                  ),
                ),
              ),itemCount: vpF!.videoList.length,scrollDirection: Axis.vertical),
            ),
          )

        ],
      ),
    ));
  }
}
