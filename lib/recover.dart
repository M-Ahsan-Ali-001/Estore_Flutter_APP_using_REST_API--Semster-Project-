import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:http/http.dart'as http;
import 'package:share_test/reset_pas.dart';
class mailerr extends StatefulWidget {
  const mailerr({Key? key}) : super(key: key);

  @override
  _mailerrState createState() => _mailerrState();
}

class _mailerrState extends State<mailerr> {
  String username = 'estore101pk@gmail.com';
  String password = 'FLUTTER_project1';
  int  OTP=0;
  String sid='service_nxwd0qa';
  String tid='template_dmmvvlz';
  String uid='euhWf91_-QK2u3Vk9';
  String rpo=" ";
  TextEditingController _eml =TextEditingController();
  TextEditingController _name =TextEditingController();
  TextEditingController _p1=TextEditingController();
  TextEditingController _p2 =TextEditingController();
  TextEditingController _p3 =TextEditingController();
  TextEditingController _p4 =TextEditingController();

  Future email()async{
    print("asdad");
    final chk= await http.post(Uri.parse("http://10.4.30.54/flutter_mysql_server/checkk.php"),
        body: {

      "email":_eml.text,
          "namee":_name.text

        });
    if(chk.body=="True") {
      print("asdad");


      Random random = new Random();
      OTP = random.nextInt(9999) + 1000;
      print("OTP:" + OTP.toString());
      final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
      final sd = await http.post(url, headers:
      {
        'Content-Type': 'application/json',


      }


          , body: jsonEncode({
            'service_id': sid,
            'template_id': tid,
            'user_id': uid, 'template_params': {

              'message': OTP.toString(),
              'reply_to': _eml.text.toString(),


            }
          }));
      print(sd.body);
    }
    else{
      setState(() {
        rpo="There is no Account of these credentials!";
      });
    }





  }

  void chkk()
  {
    String x=_p1.text.toString()+_p2.text.toString()+_p3.text.toString()+_p4.text.toString();
    print("OTP:"+x);

    if (x==OTP.toString()){

      print("true");
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>
        reset(name:_name.text ,email:_eml.text.toString() ,)), (route) => false);
    }
    else
      {
        setState(() {
          rpo="Wrong OTP Entered";
        });
      }




  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,

    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 50,),

            Container(child: Text("Password Recovery",style: TextStyle(color: Colors.white,fontSize: 40),),),
            SizedBox(
              height: 90,
            ),
            Container(
              child:   TextField(style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                        borderRadius: BorderRadius.circular(25.0)

                    ),
                    labelText: "Email",
                    hintStyle: TextStyle(color:Colors.white),

                    hintText: "Enter Email",
                    labelStyle: TextStyle(color: Colors.orange),
                    prefixIcon: Icon(Icons.person,color: Colors.orange,)
                    ,suffixStyle: TextStyle(color: Colors.red),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange),
                        borderRadius: BorderRadius.circular(25.0)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange)
                    )

                ),




                controller: _eml,
              ),

            ),
            SizedBox( height: 20,),

            Container(
              child:   TextField(style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                        borderRadius: BorderRadius.circular(25.0)

                    ),
                    labelText: "Name",
                    hintStyle: TextStyle(color:Colors.white),

                    hintText: "Enter Name",
                    labelStyle: TextStyle(color: Colors.orange),
                    prefixIcon: Icon(Icons.person,color: Colors.orange,)
                    ,suffixStyle: TextStyle(color: Colors.red),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange),
                        borderRadius: BorderRadius.circular(25.0)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange)
                    )

                ),




                controller: _name,
              ),

            ),

            SizedBox(
              height: 50,
            ),
            Text("Enter 4-Digit Number:",),
            SizedBox(
              height: 30,
            ),

            Row(
              children: [
                SizedBox(
                  width: 40,
                ),

                Container(
                  width: 50,
                  height: 50,
                  child: TextField(style: TextStyle(color: Colors.white),
                    textInputAction:TextInputAction.next,


                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly

                    ],

                    decoration: InputDecoration(
                        fillColor: Colors.white,


                        labelStyle: TextStyle(color: Colors.amberAccent),
                        focusedBorder: OutlineInputBorder(

                            borderSide: BorderSide(color: Colors.teal),

                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal)
                                              )
                    ),
                    controller: _p1,

                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 50,
                  height: 50,
                  child: TextField(style: TextStyle(color: Colors.white),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],

                    decoration: InputDecoration(
                        fillColor: Colors.white,


                        labelStyle: TextStyle(color: Colors.amberAccent),
                        focusedBorder: OutlineInputBorder(

                          borderSide: BorderSide(color: Colors.teal),

                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal)
                        )
                    ),
                    controller: _p2,

                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 50,
                  height: 50,
                  child: TextField(style: TextStyle(color: Colors.white),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],

                    decoration: InputDecoration(
                        fillColor: Colors.white,


                        labelStyle: TextStyle(color: Colors.amberAccent),
                        focusedBorder: OutlineInputBorder(

                          borderSide: BorderSide(color: Colors.teal),

                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal)
                        )
                    ),
                    controller: _p3,

                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 50,
                  height: 50,
                  child: TextField(style: TextStyle(color: Colors.white),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],

                    decoration: InputDecoration(
                        fillColor: Colors.white,


                        labelStyle: TextStyle(color: Colors.amberAccent),
                        focusedBorder: OutlineInputBorder(

                          borderSide: BorderSide(color: Colors.teal),

                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal)
                        )
                    ),
                    controller: _p4,

                  ),
                ),

              ],


            ),

            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(

                children: [
                SizedBox(
                  width: 10,
                ),
                  RaisedButton(onPressed:  email,

                    color: Colors.black26,
                    child: Text("SEND Email",style: TextStyle(color: Colors.limeAccent),),
                  ),
                  SizedBox(
                    width: 30,
                  ),


                  RaisedButton(onPressed: chkk,

                    color: Colors.black26,
                    child: Text("Submit",style: TextStyle(color: Colors.limeAccent),),
                  ),
                  SizedBox(
                    height: 15,
                  ),


                ],

              ),

            ),
            Text(rpo,style: TextStyle(color: Colors.red),),

          ],

        ),
      ),
    ),





    );
  }
}


