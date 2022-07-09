import 'dart:async';

import 'package:flutter/material.dart';
import"package:http/http.dart" as http;
import 'package:share_test/shop_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cons.dart';

class shop_logged_in extends StatefulWidget {
  final String id;
  const shop_logged_in({Key? key,required this.id }) : super(key: key);

  @override
  _shop_logged_inState createState() => _shop_logged_inState();
}

class _shop_logged_inState extends State<shop_logged_in> {


  String selectedValue = "fruits";
  TextEditingController a1 =TextEditingController();
  TextEditingController b1 =TextEditingController();
  String st=' ';

 // String id=Constants.id.getString("id")??'';
  @override
  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("fruits"),value: "fruits"),
      DropdownMenuItem(child: Text("Vegetables"),value: "Vegs"),
      DropdownMenuItem(child: Text("Dairy"),value: "dairy"),
      DropdownMenuItem(child: Text("electronics"),value: "elec"),
      DropdownMenuItem(child: Text("Clothes"),value: "cloth"),
      DropdownMenuItem(child: Text("Cosmetics"),value: "cosm"),
      DropdownMenuItem(child: Text("Consoles"),value: "console"),
      DropdownMenuItem(child: Text("Car Accessories"),value: "car"),
      DropdownMenuItem(child: Text("Phone Accessories"),value: "phone"),

    ];
    return menuItems;
  }


  Future sendit() async{
    WidgetsFlutterBinding.ensureInitialized();
    Constants .prefs = await SharedPreferences.getInstance();
    Constants .u_name = await SharedPreferences.getInstance();
    print(Constants.u_name.getString("name")??'');
    var url = Uri.parse("http://10.4.30.54/flutter_mysql_server/send_to.php");
    final rp=await http.post(url ,body: {
      "u_nm":Constants.u_name.getString("name")??''.toString(),
      "cato":selectedValue.toString(),

      "itm":a1.text,
      "prc":b1.text,
      "id":Constants.id.getString("idd")??''.toString(),


    });
    setState(() {
      st="Data Inserted";

    });











  }
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(



        title: Center(child: Text(Constants.id.getString("idd")??''.toString())),
        actions: [
          IconButton(onPressed:(){
            //Navigator.pop(context,true);
            Navigator.popAndPushNamed(context, "reg");
            Constants.prefs.setBool("loggedInshop", false);

          } ,icon:Icon(Icons.exit_to_app)),
        ],

        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(54)
            )
        ),
      ),
      drawer:shp_drawer(name:Constants.u_name.getString("name")??''.toString()),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/bf_for.jpg",fit: BoxFit.cover,color: Colors.black.withOpacity(0.3),
            colorBlendMode: BlendMode.darken,),
          SingleChildScrollView(
            child: Form(

                child:Center(
              child: Column(
                children: [
              SizedBox(height: 150,),
                  Text(" DATA",style: TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.bold),),
                  SizedBox(height: 30,),
                  Container(
                    width: 300,
                    child: DropdownButtonFormField(items: dropdownItems,value:selectedValue ,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:Colors.teal,width: 1 ),
                            borderRadius: BorderRadius.circular(20)

                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal,width: 1),
                          borderRadius: BorderRadius.circular(20)

                        ),
                        fillColor: Colors.teal,
                        filled: true,

                      ),

                      dropdownColor: Colors.teal,
                      focusColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      onChanged: (String? newValue){
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 300,
                    child: TextField(style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal),
                              borderRadius: BorderRadius.circular(25.0)

                          ),
                          labelText: "Product Name",
                          hintStyle: TextStyle(color:Colors.white),

                          hintText: "ENTER Product NAME",
                          labelStyle: TextStyle(color: Colors.tealAccent),
                          prefixIcon: Icon(Icons.person,color: Colors.tealAccent,)
                          ,suffixStyle: TextStyle(color: Colors.red),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.tealAccent),
                              borderRadius: BorderRadius.circular(30.0)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.tealAccent),

                          )

                      ),
                      controller: a1,





                    ),
                  ),//2nd
                  SizedBox(height: 30,),
                  Container(
                    width: 300,
                    child: TextField(style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal),
                              borderRadius: BorderRadius.circular(25.0)

                          ),
                          labelText: "Product Price",
                          hintStyle: TextStyle(color:Colors.white),

                          hintText: "ENTER Product price",
                          labelStyle: TextStyle(color: Colors.tealAccent),
                          prefixIcon: Icon(Icons.person,color: Colors.tealAccent,)
                          ,suffixStyle: TextStyle(color: Colors.red),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.tealAccent),
                              borderRadius: BorderRadius.circular(30.0)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.tealAccent),

                          )

                      ),
                      controller: b1,





                    ),
                  ),



                  SizedBox(height: 30,),
                   Container(
                     width: 200,
                     height: 50,
                     child: RaisedButton(onPressed:(){sendit();},
                      child: Text("INSERT",style: TextStyle(color: Colors.white),),
                      color: Colors.teal,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(90)
                      ),

                  ),
                   ),

                  SizedBox(
                    height: 15,
                  ),
                  Text(st),

                ],
              ),
            )),
          )


        ],

      ),

    );
  }
}
