import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share_test/shop_logged.dart';
import 'package:share_test/shop_login.dart';
import 'package:share_test/shop_reg.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'logged_in.dart';
import 'bg.dart';

import 'cons.dart';
import 'logged_in.dart';
import 'login.dart';
import 'regis.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants .prefs = await SharedPreferences.getInstance();
  Constants .u_name = await SharedPreferences.getInstance();
  Constants .id = await SharedPreferences.getInstance();
  //final token= await share_preff().getToken();
  //print("adasd"+token);

  runApp(MaterialApp(
    title: "test",



//    home:  Constants.prefs.getBool("loggedIn")==true?logged_in(u_name: Constants.u_name.getString("name")??''): Log_in() ,
      home: LayoutBuilder(builder: (context, constraints){
        if( Constants.prefs.getBool("loggedIn")==true) {
          return logged_in(u_name: Constants.u_name.getString("name")??'');
        }
        else if(Constants.prefs.getBool("loggedInshop")==true) {
          return shop_logged_in(id:Constants.id.getString("id")??'') ;
        }
        else {
          return Log_in();
        }
      }),
    routes: {
      "log":(context)=>Log_in(),
      "reg":(context)=>Homepage(),
      "llgd":(context)=>logged_in(u_name: Constants.u_name.getString("name")??''),
      "reg shop":(context)=>Shop_reg(),
      "log shop":(context)=>shop_Log_in(),
      "loged shop":(context)=>shop_logged_in(id: Constants.u_name.getString("idd")??''),


    },
    debugShowCheckedModeBanner: false,
  ));
}

