import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:video_p11/provider/vidoe_provider.dart';
import 'package:video_p11/view/play_screen.dart';
import 'package:video_p11/view/video_screen.dart';

void main()
{
  runApp(
   Sizer(builder: (context, orientation, deviceType) {
     return  ChangeNotifierProvider(
       create: (context) => VideoProvider(),
       child: MaterialApp(
         debugShowCheckedModeBanner: false,
         routes: {
           '/':(context) =>VideoScreen(),
           'play':(context) =>PlayScreen(),
         },
       ),
     );
   },)
  );
}