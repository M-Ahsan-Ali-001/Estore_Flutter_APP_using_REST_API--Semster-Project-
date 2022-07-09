//import 'dart:io';


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'cons.dart';
import 'login.dart';


class UPDATE extends StatefulWidget {
  final String uname;
  const UPDATE({Key? key,@required this.uname="" }) : super(key: key);

  @override
  _UPDATEState createState() => _UPDATEState();
}

class _UPDATEState extends State<UPDATE> {
  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
  String respo = "";


  Future<List> send() async
  {
    print(name.text);
    print(pass.text);
    var u = name.text;
    var p = pass.text;
    if (u.isEmpty || p.isEmpty) {
      setState(() {
        this.respo = "wrong credentials";
      });
    }
    else {
      final response = await http.post(
          Uri.parse("http://10.4.30.54/flutter_mysql_server/update.php"),
          body:
          {
            "newnm": name.text,
            "ppp": pass.text,
            "user": widget.uname,
          });
      var rrs = await http.get(
          Uri.parse("http://10.4.30.54/flutter/regg.php"));
      setState(() {
        this.respo = response.body;
      });
      // void test()
      // {

      if (this.respo == "YOUR ACCOUNT HAS BEEN UPDATED") {
        setState(() {
          this.respo = response.body;
        });
        //

        // Navigator.of(context).pop();
        // Navigator.of(context).pop();
        // Navigator.popAndPushNamed(context, "log");
        Navigator.pushNamedAndRemoveUntil(context, "log", (route) => false);

        Constants.prefs.setBool("loggedIn", false);


        //sleep(Duration(seconds:1));
      }
      // test();


      // }
      //

      print(respo);
    }
    return send();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ACCOUNTS"),
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(54)
            )
        ),
      ),


      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                height: 120,
                width: 120,
                child: CircleAvatar(backgroundImage: NetworkImage(
                    "https://www.seekpng.com/png/full/138-1387775_login-to-do-whatever-you-want-login-icon.png"),

                ),
              ),
            ),
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(

                width: 250,

                child: TextField(
                  decoration: InputDecoration(
                    labelText: "USER-NAME",
                    hintText: "ENTER NEW USERNAME",
                    focusColor: Colors.grey
                  ),
                  controller: name,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 250,

                child: TextField(
                  obscureText: true,
                    decoration: InputDecoration(
                      labelText: "PASSWORD",
                      hintText: "ENTER NEW PASSWORD",

                    ),
                  controller: pass,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),

            Container(
              height: 50,
              width: 150,
              child: RaisedButton(onPressed:(){send();},
              child: Text("CHANGE",style: TextStyle(color: Colors.white),),
                color: Colors.teal,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90)
                  ),

              ),
            )


          ],
        ),
      ),
    );
  }
}
