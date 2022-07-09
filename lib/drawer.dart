import 'package:flutter/material.dart';

import 'd1.dart';
import 'd2.dart';
import 'd3.dart';

class Custom_Drw extends StatefulWidget {
  final String name;
  const Custom_Drw({Key? key, @required this.name="" }) : super(key: key);

  @override
  _Custom_DrwState createState() => _Custom_DrwState();
}

class _Custom_DrwState extends State<Custom_Drw> {
  @override
  Widget build(BuildContext context) {
    return  Drawer(



      child: ListView(
        padding: const EdgeInsets.all(8.0),
        children:<Widget> [
          UserAccountsDrawerHeader(



              accountName: Text(widget.name,style: TextStyle(fontSize: 25),),
              accountEmail: Text(""),
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("https://www.seekpng.com/png/full/138-1387775_login-to-do-whatever-you-want-login-icon.png"),),
              ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>UPDATE(uname: widget.name,)));
            },

            leading: Icon(Icons.person),
            title: Text("ACCOUNTS"),
            subtitle: Text("ALTER INFO"),
            trailing: Icon(Icons.change_circle),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Delete(name: widget.name,)));
            },
            leading: Icon(Icons.delete),
            title: Text("DELETE"),
            subtitle: Text("Delete Account"),
            trailing: Icon(Icons.send),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>db_data()));
            },
            title: Text("PREVIOUS ORDER"),
            leading: Icon(Icons.production_quantity_limits),
            trailing: Icon(Icons.shopping_cart),
            subtitle: Text("Orders"),
          )

        ],
      ),

    );
  }
}
