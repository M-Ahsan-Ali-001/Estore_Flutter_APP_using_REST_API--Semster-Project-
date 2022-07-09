import 'dart:convert';
import "package:http/http.dart"as http;
import 'package:flutter/material.dart';
import 'card.dart';
import'cart.dart';
import 'cons.dart';
class del_ad extends StatefulWidget {

  final  name;
  const del_ad({Key? key,@required this.name}) : super(key: key);

  @override
  _del_adState createState() => _del_adState();
}

class _del_adState extends State<del_ad> {


  _del_adState();
  String selectedValue = "fruits";
  TextEditingController d= TextEditingController();

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


  @override

  Future chng() async
  {
    var url = Uri.parse('http://10.4.30.54/flutter_mysql_server/del_shp_add.php');
    final respo=await http.post(url,body: {
      'cato':selectedValue,
      'id':Constants.id.getString("idd")??''.toString(),
      'dl':d.text.toString(),
    });

   print(respo.body);
  }

  Future<List> reci() async
  {
    var url = Uri.parse('http://10.4.30.54/flutter_mysql_server/sel_f_d.php');
    final r= await http.post(url,body: {
      'cato':selectedValue.toString(),
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
        title: Text("Delete add"),
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(54),
            )
        ),
      ),
      backgroundColor: Colors.brown,
      extendBodyBehindAppBar: true,
      body: Column(



        children: [



          Expanded(


            child: FutureBuilder(
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
                      title: Text(snapshot.data![index][selectedValue+'_t']  ,style: TextStyle(color: Colors.white),),
                      subtitle: Text(snapshot.data![index]['P_'+selectedValue].toString()+' PKR ',style: TextStyle(color: Colors.orange), ),
                      // leading: Icon(Icons.production_quantity_limits_outlined),
                      trailing: Text(snapshot.data![index]['sid_'+selectedValue],style: TextStyle(color: Colors.red),),



                    ),
                  ),
                )
                    : Center(
                  child: CircularProgressIndicator(),
                )),
          ),

          Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(18.0),
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
                      reci();

                    });
                  },
                ),
              ),


              Container(
                width: 300,
                height: 40,
                child: TextField(style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                          borderRadius: BorderRadius.circular(25.0)

                      ),
                      labelText: "Product Name",
                      hintStyle: TextStyle(color:Colors.white),

                      hintText: "Enter Product Name to Delete",
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
                   controller: d,





                ),
              ),
              SizedBox(
                height: 20,
              ),

              SizedBox(
                width: 20,
              ),
              Center(
                child: RaisedButton(onPressed:(){ chng(); setState(() {
                  reci();
                });},
                  child: Text("Delete",style: TextStyle(color: Colors.white),),
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(90)
                  ),

                ),
              ),





            ],
          ),



        ],


      ),




    );


  }
}

