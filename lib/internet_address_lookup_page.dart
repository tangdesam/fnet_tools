
import 'dart:io';

import 'package:flutter/material.dart';

class InternetAddressLookupPage extends StatefulWidget {
  static const routeName='/internetAddressLookup';
  final String title;
  const InternetAddressLookupPage({Key? key, required this.title}) : super(key: key);

  @override
  State<InternetAddressLookupPage> createState() => _InternetAddressLookupPageState();
}

class _InternetAddressLookupPageState extends State<InternetAddressLookupPage> {
  final txtDestinationController = TextEditingController(text: 'flutter.dev');
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
                        labelText: 'Address',
                      ),
                      controller: txtDestinationController,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      txtOutputController.text = txtDestinationController.text + ':\n';
                      InternetAddress.lookup(txtDestinationController.text).then((value) {
                        value.forEach((element) async {
                          txtOutputController.text = txtOutputController.text + element.address + '\n';
                        });
                      });
                    },
                    child: Text('go')
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