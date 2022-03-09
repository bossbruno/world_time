import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class WorldTime{

  String location;
 late String time;
  String flag;
  String url;
  bool? isDaytime;


  WorldTime({required this.location, required this.url,required this.flag});

 Future <void> getTime() async{

   try{

     Response response = await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
     Map data=  jsonDecode(response.body);
     //get properties from data
     String Datetime = data["datetime"];
     String offset = data["utc_offset"].toString().substring(1,3);

     //create a daate time object
     DateTime now = DateTime.parse(Datetime);
     now = now.add(Duration(hours: int.parse(offset)));
isDaytime = now.hour> 6 && now.hour<18 ? true :false;
     time = DateFormat.jm().format(now);


   }
   catch(e){
     print("error is $e");
     time="could not get data";
   }


  }

}


