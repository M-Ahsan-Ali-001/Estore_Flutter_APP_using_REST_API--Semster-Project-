import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import"package:http/http.dart"as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'cart.dart';
import 'cons.dart';





class db_data extends StatefulWidget {
  const db_data({Key? key}) : super(key: key);
  @override

  _db_dataState createState() => _db_dataState();
}

class _db_dataState extends State<db_data> {

  Future<List> _loadData() async {
    Constants .u_name = await SharedPreferences.getInstance();
    String name=Constants.u_name.getString("name")??'';
    List posts = [];
    try {
      // print("here");
      // print(widget.name);
      // This is an open REST API endpoint for testing purposes
      const API = 'http://10.4.30.54/flutter_mysql_server/prev_ord.php';

      // final rp= await http.post(Uri.parse(API),body: {
      //   'unam':name.toString(),
      // });


      // final http.Response response = await http.get(Uri.parse(API));
      String a='ahsan';
      final respoense=await http.post(Uri.parse(API),body:{
        'unam':name.toString(),
      } );

      posts = json.decode(respoense.body);
      print(posts);
    } catch (err) {
      print(err);
    }

    return posts;
  }

  @override
  void initState() {
    _loadData();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Previous Orders"),

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(54)

            )
        ),
        backgroundColor: Colors.teal,


      ),
      body:Container(
        color: Colors.tealAccent,
        padding: EdgeInsets.all(2),
        child:  FutureBuilder(
            future: _loadData(),
            builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
            snapshot.hasData
                ? ListView.builder(

              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, index) => Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  onTap: (){
                    var url=Uri.parse("http://10.4.30.54/flutter_mysql_server/cancel_ord.php");
                    if (snapshot.data![index]['stat'].toString()=="pending" ){
                      final ch= http.post(url,body: {
                        'id':Constants.u_name.getString("name")??''.toString(),
                        'itm':snapshot.data![index]['ordr'],
                        'status':'Cancelled',


                      });

                      setState(() {

                        db_data();
                      });





                    }
                    else if(snapshot.data![index]['stat'].toString()=="Cancelled" ){
                      final ch= http.post(url,body: {
                        'id':Constants.u_name.getString("name")??''.toString(),
                        'itm':snapshot.data![index]['ordr'],
                        'status':'pending',


                      });

                      setState(() {

                        db_data();
                      });


                    }

                  },


                  focusColor: Colors.white,
                  selectedTileColor: Colors.white,
                  tileColor: Colors.black,
                  contentPadding: const EdgeInsets.all(10),
                  title: Text(snapshot.data![index]['ordr'] +" ( "+ snapshot.data![index]['store_id']+" )"  ,style: TextStyle(color: Colors.white),),
                  subtitle: Text(snapshot.data![index]['prc'].toString()+' PKR ',style: TextStyle(color: Colors.orange), ),
                  // leading: Icon(Icons.production_quantity_limits_outlined),
                  trailing: Text(snapshot.data![index]['stat'],style: TextStyle(color: Colors.red),),


                ),
              ),
            )
                : Center(
              child: CircularProgressIndicator(),
            )),
      ),
    );
  }
}

