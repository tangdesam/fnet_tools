
import 'dart:io';

import 'package:flutter/material.dart';

class SocketTestPage extends StatefulWidget {
  static const routeName='/socketTest';
  final String title;
  const SocketTestPage({Key? key, required this.title}) : super(key: key);

  @override
  State<SocketTestPage> createState() => _SocketTestPageState();
}

class _SocketTestPageState extends State<SocketTestPage> {
  final txtDestinationController = TextEditingController(text: 'flutter.dev');
  final txtPortController = TextEditingController(text: '80');
  final txtTimeoutController = TextEditingController(text: '5');
  final txtOutputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Connect to',
                      ),
                      controller: txtDestinationController,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Port',
                      ),
                      controller: txtPortController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Timeout',
                      ),
                      controller: txtTimeoutController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      var socket = await Socket.connect(txtDestinationController.text, int.parse(txtPortController.text), timeout: Duration(seconds: int.parse(txtTimeoutController.text))).then((socket){
                        String msg = txtDestinationController.text + ':' + txtPortController.text + ' is reachable\n';
                        txtOutputController.text = txtOutputController.text + msg;
                        socket.destroy();
                      }).catchError((error){
                        var snackBar = SnackBar(content: Text('Exception on Socket: '+ error.toString()));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      });
                    },
                    child: Text('connect')
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Output',
                      ),
                      controller: txtOutputController,
                      readOnly: true,
                      minLines: 8,
                      maxLines: 96,
                    ),
                  ),

                ],
              ),
            ),
          ),
        )
    );
  }
}