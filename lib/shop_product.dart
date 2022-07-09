import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'cons.dart';
class Views extends StatefulWidget {
  const Views({Key? key}) : super(key: key);

  @override
  _ViewsState createState() => _ViewsState();
}

class _ViewsState extends State<Views> {
  @override
  Future<List> reci() async
  {
    var url = Uri.parse('http://10.4.30.54/flutter_mysql_server/shop_prod.php');
    final r= await http.post(url,body: {
      'id':Constants.id.getString("idd")??''.toString(),


    });

    return json.decode(r.body);


  }

  @override
  void initState() {
    reci();

    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Uploaded Items"),
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(54)
            )
        ),


      ),
      backgroundColor: Colors.lightGreenAccent,
      body: Container(
        // color: Colors.tealAccent,
        padding: EdgeInsets.all(2),
        child:  FutureBuilder(
            future: reci(),
            builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
            snapshot.hasData
                ? ListView.builder(

              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, index) => Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(


                  focusColor: Colors.white,
                  selectedTileColor: Colors.white,
                  tileColor: Colors.black,
                  contentPadding: const EdgeInsets.all(10),
                  title: Text(snapshot.data![index]['fruits_t']  ,style: TextStyle(color: Colors.white),),
                  subtitle: Text(snapshot.data![index]['P_fruits'].toString()+' PKR ',style: TextStyle(color: Colors.orange), ),
                  // leading: Icon(Icons.production_quantity_limits_outlined),
                  trailing: Text(snapshot.data![index]['sid_fruits'],style: TextStyle(color: Colors.red),),


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
