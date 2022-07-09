import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import"package:http/http.dart"as http;

import 'cart.dart';





class SELECTED extends StatefulWidget {

  final String name;
   final  obj;

  const SELECTED({Key? key,required this.name ,required this.obj}) : super(key: key);
  @override

  _SELECTEDState createState() => _SELECTEDState(this.obj);
}

class _SELECTEDState extends State<SELECTED> {
  Cart obj;
  _SELECTEDState(this.obj);
  Future<List> _loadData() async {
    List posts = [];
    try {
      print("here");
      print(widget.name);
      // This is an open REST API endpoint for testing purposes
      const API = 'http://10.4.30.54/flutter_mysql_server/getter.php';

      final rp= await http.post(Uri.parse(API),body: {
        'getter':widget.name,
      });


      // final http.Response response = await http.get(Uri.parse(API));
      final respoense=await http.post(Uri.parse(API),body:{
        "getter":widget.name.toString(),
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
        title: Text(widget.name),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(54)

          )
        ),
        backgroundColor: Colors.teal,


      ),
      body:Container(
        color: Colors.grey,
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

                     obj.v=snapshot.data![index][widget.name+"_t"];
                    obj.pr= snapshot.data![index]["P_"+widget.name];
                    obj.stid= snapshot.data![index]["sid_"+widget.name];
                    obj.ad();
                    //obj.add_no();
                     Scaffold.of(context).showSnackBar(SnackBar(
                       duration: const Duration(seconds: 1),
                       content: Text(snapshot.data![index][widget.name+"_t"]+" has been added to Cart"),
                     ));


                  },

                  focusColor: Colors.grey,
                  selectedTileColor: Colors.grey,
                  tileColor: Colors.grey,
                  contentPadding: const EdgeInsets.all(10),
                  title: Text(snapshot.data![index][widget.name +"_t"]),
                   subtitle: Text(snapshot.data![index]['P_'+widget.name]+' PKR ('+snapshot.data![index]['sid_'+widget.name]+")" ),
                  leading: Icon(Icons.production_quantity_limits_outlined),
                  trailing: Icon(Icons.double_arrow),


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

