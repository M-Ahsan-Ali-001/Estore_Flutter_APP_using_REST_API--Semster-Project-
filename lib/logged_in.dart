import'package:flutter/material.dart';
import'package:http/http.dart'as http;
import 'package:share_test/test.dart';
import 'dart:convert';

import 'Selected.dart';
import 'cart.dart';
import 'cons.dart';
import 'draw_cart.dart';
import 'drawer.dart';


class logged_in extends StatefulWidget {
  final String u_name;
  const logged_in({Key? key, required this.u_name }) : super(key: key);
  @override
  _logged_inState createState() => _logged_inState();
}

class _logged_inState extends State<logged_in> {
  var obj= new Cart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // automaticallyImplyLeading: false,

        title: Center(child: Text("Wellcome! "+widget.u_name)),
        // leading: IconButton(
        //   icon: Icon(Icons.settings),
        //   onPressed: () {
        //     Custom_Drw();},),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(53)
          ),



        ),
        backgroundColor: Colors.teal,
        actions: <Widget>[
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>D_CRATE(obj:obj)));


          }, icon: Icon(Icons.shopping_cart),


          ),

           IconButton(onPressed:(){
             //Navigator.pop(context,true);
           Navigator.popAndPushNamed(context, "reg");
           Constants.prefs.setBool("loggedIn", false);

           } ,icon:Icon(Icons.exit_to_app)),



        ],

      ),

      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/bd_loged.jpg",fit: BoxFit.cover,color: Colors.black.withOpacity(0.6),
            colorBlendMode: BlendMode.darken,)
          ,
          Center(
            child: Card(

              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: SingleChildScrollView(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //Text("What Do You want to Buy?",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                          //SizedBox(height: 30,),
                          GestureDetector(
                            onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>SELECTED(name: "fruits",obj: obj,)));},
                            child: Container( height: 120, width: 100,color: Colors.transparent,
                              child: Column(
                                children: [

                                  Image.asset("assets/f.jpg",fit: BoxFit.cover),
                                  Text("Fruits",style: TextStyle(color: Colors.white),)

                                ],
                              ),
                       ),
                          ),
                          GestureDetector(
                            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SELECTED(name: "Vegs",obj: obj)));},
                            child: Container( height: 120, width: 100,color: Colors.transparent,
                              child: Column(
                                children: [
                                  Image.asset("assets/vv.jpg",fit: BoxFit.cover),
                                  Text("Vegetables",style: TextStyle(color: Colors.white),)
                                ],
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SELECTED(name: "dairy",obj: obj)));},
                            child: Container( height: 120, width: 100,color: Colors.transparent,
                              child: Column(
                                children: [
                                  Image.asset("assets/da.jpg",fit: BoxFit.cover),
                                  Text("dairy products",style: TextStyle(color: Colors.white),)
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),

                      //separation here-----1-1-


                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //Text("What Do You want to Buy?",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                          //SizedBox(height: 30,),
                          GestureDetector(
                            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SELECTED(name: "elec",obj: obj)));},
                            child: Container( height: 120, width: 100,color: Colors.transparent,
                              child: Column(
                                children: [

                                  Image.asset("assets/nn.jpg",fit: BoxFit.cover),
                                  Text("Electronics",style: TextStyle(color: Colors.white),)
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SELECTED(name: "cloth",obj: obj)));},
                            child: Container( height: 120, width: 100,color: Colors.transparent,
                              child: Column(
                                children: [
                                  Image.asset("assets/clo.jpg",fit: BoxFit.cover),
                                  Text("Clothes",style: TextStyle(color: Colors.white),)
                                ],
                              ),
                            ),
                          ),
                          
                          GestureDetector(
                            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SELECTED(name: "cosm",obj: obj)));},
                            child: Container( height: 120, width: 100,color: Colors.transparent,
                              child: Column(
                                children: [
                                  Image.asset("assets/cc.jpg",fit: BoxFit.cover),
                                  Text("Cosmetics",style: TextStyle(color: Colors.white),)
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                      // last speration ----==----
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //Text("What Do You want to Buy?",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                          //SizedBox(height: 30,),
                          GestureDetector(
                            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SELECTED(name: "console",obj: obj)));},
                            child: Container( height: 120, width: 100,color: Colors.transparent,
                              child: Column(
                                children: [

                                  Image.asset("assets/n.jpg",fit: BoxFit.cover),
                                  Text("Consoles",style: TextStyle(color: Colors.white),)
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SELECTED(name: "car",obj: obj)));},
                            child: Container( height: 120, width: 100,color: Colors.transparent,
                              child: Column(
                                children: [
                                  Image.asset("assets/cp.jpg",fit: BoxFit.cover),
                                  Text("Car parts",style: TextStyle(color: Colors.white),)
                                ],
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>SELECTED(name: "phone",obj: obj)));},
                            child: Container( height: 120, width: 100,color: Colors.transparent,
                              child: Column(
                                children: [
                                  Image.asset("assets/pro.jpg",fit: BoxFit.cover),
                                  Text("Phones parts",style: TextStyle(color: Colors.white),)
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),

                    ],






                  ),
                ),

              ),

            ),
          )
          
          
          
        ],
        
        
      ),
      drawer: Custom_Drw(name: widget.u_name,),
    );
  }
}
