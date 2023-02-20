
import 'dart:io';

import 'package:flutter/material.dart';

class SocketTestPage extends StatelessWidget {
  static const routeName='/socketTest';
  final String title;
  const SocketTestPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Connect to',
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Port',
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                ElevatedButton(
                    onPressed: () async {
                      var socket = await Socket.connect('google.com', 80, timeout: Duration(seconds: 5)).then((socket){
                        print("Success");
                        socket.destroy();
                      }).catchError((error){
                        var pingMsg = SnackBar(content: Text('Exception on Socket: '+ error.toString()));
                        ScaffoldMessenger.of(context).showSnackBar(pingMsg);
                      });
                    },
                    child: Text('connect')
                ),
              ],
            ),
          ),
        )
    );
  }
}