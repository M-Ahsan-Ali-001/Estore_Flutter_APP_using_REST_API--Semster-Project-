import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'cart.dart';
import 'cons.dart';


class CARD extends StatefulWidget {
  final  obj;
  const CARD({Key? key,required this.obj}) : super(key: key);

  @override
  State<CARD> createState() => _CARDState(this.obj);
}

class _CARDState extends State<CARD> {
  Cart obj;
  _CARDState(this.obj);
  TextEditingController t1 =TextEditingController();
  TextEditingController t2 =TextEditingController();
  TextEditingController t3 =TextEditingController();
  TextEditingController t4 =TextEditingController();
  TextEditingController t5 =TextEditingController();
  String seter="";



  Future send() async{
    if( t1.text=="" || t2.text=="" || t3.text==""|| t4.text=="" || t5.text=="" ) {


       setState(() {
         seter="wrong info ";
       });

      }
    else{
      try {
        obj.tost();
        print(obj.tostrg);
        print(obj.tottal());
        var a1 = obj.tostrg;
        var a2 = obj.tottal();
        var a3 = "pending";
        String a4 = Constants.u_name.getString("name") ?? '';
        String a6 = 'islamabad';
        Constants.u_name = await SharedPreferences.getInstance();
        print(Constants.u_name.getString("name") ?? '');

        var llen=obj.arr.length;
        int i=0;



        var url = Uri.parse(
            "http://10.4.30.54/flutter_mysql_server/cart.php");
        // final r = await http.post(url, body: {
        //   'itms': a1.toString(),
        //   'pr': a2.toString(),
        //   'stat': a3.toString(),
        //   'u_nam': a4.toString(),
        //   'addrs':t3.text.toString(),
        //
        //
        // });
        print("loop");

        while(i<llen){
          print(obj.arr[i]);
           await http.post(url, body: {
            'itms': obj.arr[i],
             'pr': obj.arr2[i],
            'stat': a3,
            'u_nam': a4,
            'addrs':t3.text,
            'st_id':obj.sst_id[i]
          });

          i=i+1;
        }
        setState(() {
          seter = "Transaction Done! ";
        });
        obj.empty();
        // Navigator.popAndPushNamed(context, "llgd");
        // sleep(new Duration(seconds: 10));
        delay();

      }
      catch(err){
        print('Caught error: $err');
        setState(() {
          seter ='Caught error: $err';
        });
      }




    }


  }
  Future delay() async{
    await new Future.delayed(new Duration(milliseconds: 1500), () {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.popAndPushNamed(context, "llgd");


    });

  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
       extendBodyBehindAppBar: true,
      appBar: AppBar(

        title: Text("Payment",),
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(54)
          )
        ),
      ),
      body:Container(
        color: Colors.grey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // SizedBox(height: 50,),
              Container(
                color: Colors.black26,
                height: 290,
                child:Column(
                  children: [
                    SizedBox(height: 30,),
                    Center(child: Image.asset("assets/card.png",height: 260,width: 300,)),
                  ],
                )
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(23.0),
                  child: Column(

                    children: [
                      TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.green,
                          labelText: "Card No.",
                          hintText: "4111-0000-0000-0000",
                          prefix: Image.asset('assets/v.png',height: 21,width: 40,),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color:Colors.green)
                          ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)
                            ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                          ),
                          labelStyle:TextStyle(color: Colors.lightGreenAccent,fontWeight: FontWeight.bold)

                        ),
                        controller: t1,
                      ),
                      SizedBox(height: 10,),

                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(

                            fillColor: Colors.green,
                            labelText: "Password",
                            hintText: "PASSWORD",
                            prefix: Image.asset('assets/v.png',height: 21,width: 40,),
                            border: OutlineInputBorder(

                                borderSide: BorderSide(color:Colors.green)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)
                            ),
                            labelStyle:TextStyle(color: Colors.lightGreenAccent,fontWeight: FontWeight.bold)

                        ),
                        controller: t2,
                      ),
                      SizedBox(
                        height: 10,
                      ),


                      TextField(
                        decoration: InputDecoration(

                            fillColor: Colors.green,
                            labelText: "Address",
                            hintText: "Enter",
                            //prefix: Image.asset('assets/v.png',height: 21,width: 40,),
                            border: OutlineInputBorder(

                                borderSide: BorderSide(color:Colors.green)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)
                            ),
                            labelStyle:TextStyle(color: Colors.lightGreenAccent,fontWeight: FontWeight.bold)

                        ),
                        controller: t3,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: TextField(
                              decoration: InputDecoration(

                                  fillColor: Colors.green,
                                  labelText: "Date of Expirey",
                                  hintText: "Enter",
                                  //prefix: Image.asset('assets/v.png',height: 21,width: 40,),
                                  border: OutlineInputBorder(

                                      borderSide: BorderSide(color:Colors.green)
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black)
                                  ),
                                  labelStyle:TextStyle(color: Colors.lightGreenAccent,fontWeight: FontWeight.bold)

                              ),
                              controller: t4,
                            ),


                          ),
                          SizedBox(width: 13,),
                          SizedBox(
                            height: 50,
                            width: 150,
                            child: TextField(
                              decoration: InputDecoration(

                                  fillColor: Colors.green,
                                  labelText: "Security Code",
                                  hintText: "Enter",
                                  //prefix: Image.asset('assets/v.png',height: 21,width: 40,),
                                  border: OutlineInputBorder(

                                      borderSide: BorderSide(color:Colors.green)
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black)
                                  ),
                                  labelStyle:TextStyle(color: Colors.lightGreenAccent,fontWeight: FontWeight.bold)

                              ),
                              controller: t5,
                            ),


                          ),



                        ],




                      ),
                      SizedBox(height: 40,),
                      SizedBox(
                        width: 300,
                        height: 50,
                        child: RaisedButton(onPressed: (){send();},
                          color: Colors.deepPurple,
                          child: Text("Purchase for "+widget.obj.tottal().toString(),style: TextStyle(color: Colors.white),),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(90)
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(seter),

                      SizedBox(
                        height:50 ,
                      )






                    ],
                  ),
                ),
              )


            ],
          ),
        ),



      ),
    );
  }
}
