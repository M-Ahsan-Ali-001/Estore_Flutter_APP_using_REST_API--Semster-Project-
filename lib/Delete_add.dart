import 'dart:convert';
import "package:http/http.dart"as http;
import 'package:flutter/material.dart';
import 'card.dart';
import'cart.dart';
import 'cons.dart';
class update_ad extends StatefulWidget {

  final  name;
  const update_ad({Key? key,@required this.name}) : super(key: key);

  @override
  _update_adState createState() => _update_adState();
}

class _update_adState extends State<update_ad> {


  _update_adState();
  String selectedValue = "fruits";
  TextEditingController f1 =TextEditingController();
  TextEditingController f2 =TextEditingController();
  TextEditingController f3 =TextEditingController();

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

Future chng(choice ) async
  {
    var url = Uri.parse('http://10.4.30.54/flutter_mysql_server/shoP_add_updt.php');
    print(choice);
    final r= await http.post(url,body: {

       'p_name':f1.text,
       'new_nm_pr':f2.text,
       'new_pr':f3.text,
       'choice':choice.toString(),
       'id':Constants.id.getString("idd")??''.toString(),
       'cat':selectedValue.toString(),

    });


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
        title: Text("Update Data"),
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(54),
            )
        ),
      ),
      backgroundColor: Colors.blue,
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
              SizedBox(width: 30,),
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

                      hintText: "Enter Product NAME",
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
                   controller: f1,





                ),
              ),
              SizedBox(
                height: 20,
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
                      labelText: "New Product Name",
                      hintStyle: TextStyle(color:Colors.white),

                      hintText: "Enter New Product NAME",
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
                  controller: f2,





                ),
              ),
              SizedBox(
                height: 20,
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
                      labelText: "New Price",
                      hintStyle: TextStyle(color:Colors.white),

                      hintText: "Enter New Price",
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
                   controller: f3,





                ),

              ),
              SizedBox(height: 25,),
              Row(

                children: [
                  SizedBox(width: 30,),
                  RaisedButton(onPressed:(){chng(1); setState(() {
                    reci();
                  });},
                    child: Text("Change name",style: TextStyle(color: Colors.white),),
                    color: Colors.teal,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(90)
                    ),

                  ),
                  SizedBox(width: 50,),


                  RaisedButton(onPressed:(){ chng(2); setState(() {
                    reci();
                  });},
                    child: Text("Change price",style: TextStyle(color: Colors.white),),
                    color: Colors.teal,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(90)
                    ),

                  ),
                  ],

              )



            ],
          ),



        ],


      ),




    );


  }
}

