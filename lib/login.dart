import 'dart:async';

import"package:flutter/material.dart";

import"package:http/http.dart" as http;
import 'package:share_test/recover.dart';
import 'package:share_test/shop_login.dart';
import "dart:convert";


import 'cons.dart';
import 'logged_in.dart';

void main()=> runApp(MaterialApp(
  home:Log_in(),
));

class Log_in extends StatefulWidget {
  const Log_in({Key? key}) : super(key: key);

  @override
  _Log_inState createState() => _Log_inState();
}

class _Log_inState extends State<Log_in> {
  TextEditingController u_nam=TextEditingController();
  TextEditingController pas=TextEditingController();
  String res="";
  String rec="";

  // Future<List> tets()
  // {
  //   String a="asda";
  //   return tets();
  // }

  Future send_log() async
  {
    print("ca");
    var url = Uri.parse("http://10.4.30.54/flutter_mysql_server/login.php");
    if (u_nam.text=="" || pas.text=="")
      {
        setState(() {
          this.res="Wrong Login Credentials!";
          Timer(Duration(seconds: 2), () {
            setState(() {
              this.res=" ";

            });





          });
        });
      }
    else
      {
        print("test"+ u_nam.text);
        final rp=await http.post(url ,body: {

          "unam":u_nam.text,
          "pass":pas.text,

        });
        var rpp=await http.get(url);
       setState(() {

         this.rec= rp.body;
       });
       print(rec);

       if (this.rec=="True")
         {
           setState(() {
             this.res="Logged-IN";
             // Api().loginuser();
           });



           Constants.prefs.setBool("loggedIn", true);

           Constants.u_name.setString('name', u_nam.text);
           //Navigator.popAndPushNamed(context, "llgd");
           Navigator.pushNamedAndRemoveUntil(context, "llgd", (route) => false);
           // Navigator.of(context).pop();



         }
       else
         {

           print("delaasdas");

           setState(() {
             this.res="Wrong Login Credentials";

             Timer(Duration(seconds: 3), () {

               this.res=" ";



               print("Yeah, this line is printed after 3 seconds");
             });

           });
           print("dela");


           dly();

         }

      }
   // return tets();


  }
  void dly(){

    Timer(Duration(seconds: 3), () {
      setState(() {

        this.res=" ";

      });




      print("Yeah, this line is printed after 3 seconds");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text("Login")),
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
        Image.asset("assets/lg.jpg",fit: BoxFit.cover,color: Colors.black.withOpacity(0.5),
        colorBlendMode: BlendMode.darken,),
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
                                labelStyle: TextStyle(color: Colors.tealAccent),
                                prefixIcon: Icon(Icons.person,color: Colors.tealAccent,)
                                ,suffixStyle: TextStyle(color: Colors.red),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.tealAccent),
                                    borderRadius: BorderRadius.circular(25.0)
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.tealAccent)
                                )

                            ),




                            controller: u_nam,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(style: TextStyle(color: Colors.white),
                            obscureText: true,
                            decoration: InputDecoration(
                                labelText: "PASSWORD",
                                hintText: "Enter password",
                                hintStyle: TextStyle(color: Colors.white),
                                labelStyle: TextStyle(color: Colors.tealAccent),
                                prefixIcon: Icon(Icons.lock,color: Colors.tealAccent,)
                                ,suffixStyle: TextStyle(color: Colors.red),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.tealAccent),
                                    borderRadius: BorderRadius.circular(25.0)
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.tealAccent)
                                )
                            ),


                            controller: pas,
                          ),
                          SizedBox(
                            height: 40,
                          ),

                          Row(
                            children: [
                              RaisedButton(onPressed: (){ Navigator.popAndPushNamed(context, "reg");},
                                color: Colors.black26,
                                child: Text("Register",style: TextStyle(color: Colors.tealAccent),),
                              ),
                              SizedBox(width: 90,),
                              RaisedButton(onPressed: send_log,

                                color: Colors.black26,
                                child: Text("Login",style: TextStyle(color: Colors.tealAccent),),
                              )

                            ],
                          ),
                          Text(res,style: TextStyle(color: Colors.limeAccent),),
                         SizedBox(
                           height: 10,
                         ),
                          InkWell(
                            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>shop_Log_in()));},
                            child: Text("Shop login Click here",style: TextStyle(color: Colors.redAccent),),
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          InkWell(
                            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>mailerr()));},
                            child: Text("Forget Your Password",style: TextStyle(color: Colors.orange),),
                          ),

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

