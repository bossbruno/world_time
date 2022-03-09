import 'package:flutter/material.dart';
import 'package:world_time/pages/chse_location.dart';
import 'package:world_time/pages/loading.dart';
import 'pages/home.dart';
void main() {
  runApp(MaterialApp(

    routes: {
      "/": (context)=> Loading(),
      "/home": (context)=>Home(),
      "/location": (context)=>ChooseLocation()
    },
    initialRoute: "/",
  ));
}

