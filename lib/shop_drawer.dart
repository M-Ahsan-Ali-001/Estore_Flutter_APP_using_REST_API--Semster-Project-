import 'package:flutter/material.dart';
import 'package:share_test/shop_chg_ifo.dart';
import 'package:share_test/shop_product.dart';

import 'Delete_add.dart';
import 'Delete_shop_acc.dart';
import 'Real_delete_shop.dart';
import 'cons.dart';
import 'orders.dart';



class shp_drawer extends StatefulWidget {
  final String name;
  const shp_drawer({Key? key, @required this.name="" }) : super(key: key);

  @override
  _shp_drawerState createState() => _shp_drawerState();
}

class _shp_drawerState extends State<shp_drawer> {
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=> UPDATE_shp()));

            },

            leading: Icon(Icons.person),
            title: Text("ACCOUNTS"),
            subtitle: Text("ALTER INFO"),
            trailing: Icon(Icons.change_circle),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>Views()));


            },
            leading: Icon(Icons.view_carousel_outlined),
            title: Text("View Items"),
            subtitle: Text("view items"),
            trailing: Icon(Icons.settings_display),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Orders()));

            },
            title: Text("Orders"),
            leading: Icon(Icons.production_quantity_limits),
            trailing: Icon(Icons.shopping_cart),
            subtitle: Text("Customers Orders"),
          ),

          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>update_ad(name: "fruits",)));


            },
            title: Text("Update your Ads"),
            leading: Icon(Icons.update),
            trailing: Icon(Icons.settings),
            subtitle: Text("Alter"),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>del_ad()));

            },
            title: Text("Delete Ads"),
            leading: Icon(Icons.remove),
            trailing: Icon(Icons.remove_circle_outline),
            subtitle: Text("remove"),
          ),

          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Delete_sh()));

            },
            title: Text("Delete Account"),
            leading: Icon(Icons.delete_forever),
            trailing: Icon(Icons.delete_outlined),
            subtitle: Text("delete"),
          ),

        ],
      ),

    );
  }
}
