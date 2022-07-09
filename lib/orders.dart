import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'cons.dart';
class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Future<List> reci() async
  {
    var url = Uri.parse('http://10.4.30.54/flutter_mysql_server/ord.php');
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
        title: Text(" Customers Orders"),
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(54)
            )
        ),


      ),
      backgroundColor: Colors.orange,
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
                  onTap: (){
                    var stt= snapshot.data![index]['stat'];
                    var url = Uri.parse('http://10.4.30.54/flutter_mysql_server/chng_status.php');

                    if(stt=="pending"){
                      final ch= http.post(url,body: {
                        'id':Constants.id.getString("idd")??''.toString(),
                        'itm':snapshot.data![index]['ordr'],
                        'status':'Active',


                      });

                      setState(() {

                        reci();
                      });


                    }
                    else{
                      final ch= http.post(url,body: {
                        'id':Constants.id.getString("idd")??''.toString(),
                        'itm':snapshot.data![index]['ordr'],
                        'status':'Closed',


                      });
                      setState(() {

                        reci();
                      });



                    }


                  },


                  focusColor: Colors.white,
                  selectedTileColor: Colors.white,
                  tileColor: Colors.black,
                  contentPadding: const EdgeInsets.all(10),
                  title: Text(snapshot.data![index]['ordr']  ,style: TextStyle(color: Colors.white),),
                  subtitle: Text("( " + snapshot.data![index]['u_name'].toString() + " )"+ snapshot.data![index]['addrs'].toString(),style: TextStyle(color: Colors.orange), ),
                  // leading: Icon(Icons.production_quantity_limits_outlined),
                  trailing: Text(snapshot.data![index]['prc'].toString() + " PKR" +"\n" + snapshot.data![index]['stat'],style: TextStyle(color: Colors.red),),


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
