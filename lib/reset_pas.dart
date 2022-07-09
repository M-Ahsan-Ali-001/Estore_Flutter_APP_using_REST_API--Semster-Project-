import 'package:flutter/material.dart';
import'package:http/http.dart'as http;
class reset extends StatefulWidget {
  final String name;
  final String email;
  const reset({Key? key,required this.name,required this.email}) : super(key: key);

  @override
  State<reset> createState() => _resetState();
}

class _resetState extends State<reset> {

  TextEditingController _p1=TextEditingController();
  TextEditingController _p2=TextEditingController();
  String respo=' ';
  Future chng_p()async {
    print(_p1.text+_p2.text+widget.name.toString()+widget.email.toString());
    if(_p1.text.toString()==_p2.text.toString()){
      var url= Uri.parse("http://10.4.30.54/flutter_mysql_server/rst.php");
      final ins =await http.post(url,body:{
        "pass":_p1.text,
        "name": widget.name.toString(),
        "email":widget.email.toString(),




      });
      Navigator.pushNamedAndRemoveUntil(context, "log", (route) => false);





    }
    else{
      setState(() {
        respo="password does not match!";
      });

    }


  }




  @override

  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.teal,
      body: SingleChildScrollView(
        child: Column(

          children: [
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Reset Password",style: TextStyle(color: Colors.white,fontSize: 50),),
            ),

            SizedBox(
              height: 50,
            ),

        Container(
          child:   Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal),
                      borderRadius: BorderRadius.circular(25.0)

                  ),
                  labelText: "Password",
                  hintStyle: TextStyle(color:Colors.white),

                  hintText: "Enter Password",
                  labelStyle: TextStyle(color: Colors.orange),
                  prefixIcon: Icon(Icons.person,color: Colors.orange,)
                  ,suffixStyle: TextStyle(color: Colors.red),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                      borderRadius: BorderRadius.circular(25.0)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange)
                  )

              ),




               controller: _p1,
            ),
          ),
        ),
            SizedBox(width:10 ,),

            Container(
              child:   Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                          borderRadius: BorderRadius.circular(25.0)

                      ),
                      labelText: "Re-Enter-Password",
                      hintStyle: TextStyle(color:Colors.white),

                      hintText: "Enter Password",
                      labelStyle: TextStyle(color: Colors.orange),
                      prefixIcon: Icon(Icons.person,color: Colors.orange,)
                      ,suffixStyle: TextStyle(color: Colors.red),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                          borderRadius: BorderRadius.circular(25.0)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange)
                      )

                  ),




                  controller: _p2,
                ),
              ),
            ),
            SizedBox(width:20 ,),

            RaisedButton(onPressed: chng_p,

              color: Colors.red,
              child: Text("Change",style: TextStyle(color: Colors.limeAccent),),
            ),
            SizedBox(width:20 ,),
            Text(respo,style: TextStyle(color: Colors.red),)


          ],
        ),
      ),

    );
  }
}
