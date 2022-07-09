import 'package:flutter/material.dart';

import 'package:http/http.dart'as http;
import 'package:share_test/regis.dart';

import 'cons.dart';

class Delete_sh extends StatefulWidget {
  final String name;
  const Delete_sh({Key? key,@required this.name=""}) : super(key: key);

  @override
  _Delete_shState createState() => _Delete_shState();
}

class _Delete_shState extends State<Delete_sh> {
  String res="";
  String state="";
  Future re() async{
    var url= Uri.parse("http://10.4.30.54/flutter_mysql_server/dele_shp_acc.php");
    var response= await http.post(url,body: {
      "user":Constants.id.getString("idd")??''.toString(),
    });
    var get= await http.get(url);
    res=get.body;


    setState(() {
      state="Your id has been deleted!";
    });
    //Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
    // Navigator.of(context).pop();
    // Navigator.of(context).pop();
    // Navigator.popAndPushNamed(context,"reg");
    //Navigator.pop(context,true);
   Navigator.pushNamedAndRemoveUntil(context, "reg", (route) => false);
    Constants.prefs.setBool("loggedIn", false);





  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Delete"),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(54)
              )
          ),
          backgroundColor: Colors.teal,

        ),
        body:Center(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 200,),
                Text("Are You sure ?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                SizedBox(height: 10,),
                RaisedButton(onPressed: (){re();},child: Text("Delete",style: TextStyle(color: Colors.white),),color: Colors.red,)
                ,
                Text(state),



              ],
            ),
          ),
        )

    );
  }
}

