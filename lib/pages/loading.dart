import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    Response response =  await get('http://worldtimeapi.org/api/timezone/America/Guatemala');
    Map data = jsonDecode(response.body);

    // get the data properties
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
//    print('$offset');
    DateTime now = DateTime.parse(datetime);
    print(now);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);



  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading'),
    );
  }
}
