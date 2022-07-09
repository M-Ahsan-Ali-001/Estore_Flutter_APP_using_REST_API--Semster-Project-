import 'package:flutter/material.dart';
import 'card.dart';
import'cart.dart';
class D_CRATE extends StatefulWidget {
  final  obj;
  //final ob = new Cart();
   const D_CRATE({Key? key,@required this.obj=""}) : super(key: key);

  @override
  _D_CRATEState createState() => _D_CRATEState(this.obj);
}

class _D_CRATEState extends State<D_CRATE> {
  final Cart obj;

  _D_CRATEState(this.obj);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRATE"),
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(54),
          )
        ),
      ),
    body: Column(



      children: [


        Expanded(


          child: ListView.builder(
              itemCount: obj.arr.length,
              itemBuilder: (BuildContext context,int index){
                return ListTile(
                  onTap: (){
                    obj.rem=obj.arr[index];
                    obj.del_pr=obj.arr2[index];
                    obj.r_stid=obj.sst_id[index];
                    obj.delete();
                    setState(() {
                      D_CRATE(obj: obj,);
                    });


                  },
                  title: Text(obj.arr[index]+" (" + obj.sst_id[index] +" )"),
                  leading: Icon(Icons.done_outline_sharp),
                  subtitle: Text('Tap to Remove'),
                  trailing: Text(obj.arr2[index]+" PKR"),
                );
              }),
        ),
      RaisedButton(onPressed: (){
        print(obj.tottal()
        );
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CARD(obj: obj,)));



      },child: Text("Buy",style: TextStyle(color: Colors.white),),
      color: Colors.teal,
      )
      ],


    ),




    );


  }
}

