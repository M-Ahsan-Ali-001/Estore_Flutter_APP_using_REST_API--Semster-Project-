import 'package:flutter/material.dart';

// import this to be able to call json.decode()
import 'dart:convert';

// import this to easily send HTTP request
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      theme: ThemeData(accentColor: Colors.amber),
      title: 'Kindacode.com',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List> _loadData() async {
    List posts = [];
    try {
      print("here");
      // This is an open REST API endpoint for testing purposes
      const API = 'http://192.168.100.199/flutter_mysql_server/getter.php';

      final http.Response response = await http.get(Uri.parse(API));
      posts = json.decode(response.body);
      print(posts);
    } catch (err) {
      print(err);
    }

    return posts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Kindacode.com'),
        ),
        body: FutureBuilder(
            future: _loadData(),
            builder: (BuildContext ctx, AsyncSnapshot<List> snapshot) =>
            snapshot.hasData
                ? ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, index) => Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  title: Text(snapshot.data![index]['Fruits']),
                   subtitle: Text(snapshot.data![index]['P_Fruits']),


                ),
              ),
            )
                : Center(
              child: CircularProgressIndicator(),
            )));
  }
}