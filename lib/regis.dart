import 'dart:async';
import 'dart:convert';
//import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:share_test/shop_reg.dart';

import 'bg.dart';
import 'login.dart';


class Homepage extends StatefulWidget {

  @override
  _HomepageState createState() => _HomepageState();
}


class _HomepageState extends State<Homepage> {

  TextEditingController u_name= TextEditingController();
  TextEditingController pass= TextEditingController();
  TextEditingController _email= TextEditingController();
  String respo ="";

  Future send() async
  {
    print(u_name.text);
    print(pass.text);
    var u = u_name.text;
    var p = pass.text;

    if (u.isEmpty || p.isEmpty || _email.text.isEmpty) {
      setState(() {
        this.respo = "wrong credentials";
        Timer(Duration(seconds: 2), () {
          setState(() {
            this.respo=" ";

          });





        });

      });
    }
    else {
      final response = await http.post(
          Uri.parse("http://10.4.30.54/flutter_mysql_server/regis.php"), body:
      {
        "u_nm": u_name.text,
        "passs": pass.text,
        "email":_email.text

      });
      var rrs = await http.get(
          Uri.parse("http://10.4.30.54/flutter_mysql_server/regis.php"));

      setState(() {
        this.respo = response.body;
        Timer(Duration(seconds: 2), () {
          setState(() {
            this.respo=" ";

          });





        });
      });
     // Navigator.pop(context,true);


      print(respo);
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

       extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text("Register")),
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(54),
            )
        ),
      ),
      body:Stack(
        fit: StackFit.expand,

        children: [
          BgImage(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Card(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(17),
                  child: Form(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: 250,
                            height: 90,
                            child: Image.asset("assets/st.png"),
                          ),

                          Text("E-Store",style: TextStyle(fontSize: 30,color: Colors.orange,fontWeight:FontWeight.bold),),
                          SizedBox(height: 50,),
                          TextField(style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal),
                                  borderRadius: BorderRadius.circular(25.0)

                              ),
                              labelText: "USERNAME",
                              hintStyle: TextStyle(color:Colors.white),

                              hintText: "ENTER USER NAME",
                              labelStyle: TextStyle(color: Colors.amberAccent),
                              prefixIcon: Icon(Icons.person,color: Colors.amberAccent,)
                                ,suffixStyle: TextStyle(color: Colors.red),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.amberAccent),
                                borderRadius: BorderRadius.circular(25.0)
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.amberAccent)
                              )

                            ),




                            controller: u_name,
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          //
                          TextField(style: TextStyle(color: Colors.white),

                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.teal),
                                    borderRadius: BorderRadius.circular(25.0)

                                ),
                                labelText: "email",
                                hintStyle: TextStyle(color:Colors.white),


                                hintText: "email",
                                labelStyle: TextStyle(color: Colors.amberAccent),
                                prefixIcon: Icon(Icons.person,color: Colors.amberAccent,)
                                ,suffixStyle: TextStyle(color: Colors.red),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.amberAccent),
                                    borderRadius: BorderRadius.circular(25.0)
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.amberAccent)
                                )

                            ),




                            controller: _email,
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          //
                          TextField(style: TextStyle(color: Colors.white),
                            obscureText: true,
                            decoration: InputDecoration(
                                labelText: "PASSWORD",
                                hintText: "Enter password",
                                hintStyle: TextStyle(color: Colors.white),
                                labelStyle: TextStyle(color: Colors.amberAccent),
                              prefixIcon: Icon(Icons.lock,color: Colors.amberAccent,)
                              ,suffixStyle: TextStyle(color: Colors.red),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.amberAccent),
                                  borderRadius: BorderRadius.circular(25.0)
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.amberAccent)
                              )
                            ),


                            controller: pass,
                          ),
                          SizedBox(
                            height: 40,
                          ),

                          Row(
                            children: [
                              RaisedButton(onPressed: (){ Navigator.popAndPushNamed(context, "log");
                                // Navigator.pop(context,true);
                              },
                                color: Colors.black26,
                                child: Text("Login",style: TextStyle(color: Colors.limeAccent),),
                              ),
                              SizedBox(width: 90,),
                              RaisedButton(onPressed: send,

                                color: Colors.black26,
                                child: Text("Register",style: TextStyle(color: Colors.limeAccent),),
                              )

                            ],
                          ),
                          Text(respo,style: TextStyle(color: Colors.limeAccent),),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Shop_reg()));

                            },
                            child: Text("Shop register Click here",style: TextStyle(color: Colors.redAccent),),
                          )

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],


      ),
    );
  }
}


