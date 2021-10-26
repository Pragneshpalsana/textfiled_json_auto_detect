import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(test());
}

class test extends StatelessWidget {
  const test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: jsontotextfiled(),
    );
  }
}

class jsontotextfiled extends StatefulWidget {
  const jsontotextfiled({Key? key}) : super(key: key);

  @override
  _jsontotextfiledState createState() => _jsontotextfiledState();
}

class _jsontotextfiledState extends State<jsontotextfiled> {
  List listdata = [];

  // Future<List> readJson() async {
  //   final String response = await rootBundle.loadString('asset/data.json');
  //   final list = await json.decode(response);
  //
  //   for (int i = 0; i < list.length; i++) {
  //     Map map = list[i];
  //
  //     String   name = map["name"];
  //     String address = map["address"];
  //     var contact = map["contact"];
  //     var email = map["email"];
  //
  //     print(email);
  //     print(name);
  //     print(address);
  //     print(contact);
  //   }

  Future<List> datafromapi() async {
    final String response = await rootBundle.loadString('asset/data.json');
    listdata = await json.decode(response);

    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    for (int index = 0; index < listdata.length; index++)
    {

      if (listdata[index]["type"] == "name") {
        aaaaaaaaaaaaa = TextInputType.name;
      } else if (listdata[index]["type"] == "address") {
        aaaaaaaaaaaaa = TextInputType.streetAddress;
      } else if (listdata[index]["type"] == "email") {
        aaaaaaaaaaaaa = TextInputType.emailAddress;
      }
      else if (listdata[index]["type"] == "date") {
        aaaaaaaaaaaaa = TextInputType.datetime;
      }
      else if (listdata[index]["type"] == "number") {
        aaaaaaaaaaaaa = TextInputType.number;
      }

setState(() {

});
    }

    return listdata;
  }

  // for(var i=0;i<list.length;i++)
  //   {
  //
  //     Map map=list["name"];
  //
  //      String name=list["name"];
  //      print(map);
  //
  //   }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    datafromapi();
  }

  dynamic aaaaaaaaaaaaa;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Json to Textfiled Dynamic data"),
      ),
      body: ListView.builder(
        itemCount: listdata.length,
        itemBuilder: (context, index) {

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: TextFormField(
                  keyboardType: aaaaaaaaaaaaa,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: listdata[index]["name"]),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
