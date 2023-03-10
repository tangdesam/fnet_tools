import 'package:flutter/material.dart';
import 'package:fnet_tools/internet_address_lookup_page.dart';
import 'package:fnet_tools/socket_test_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Flutter Networking Tools';
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: const MenuPage(title: appTitle),
      initialRoute: MenuPage.routeName,
      routes: {
        MenuPage.routeName : (context) => MenuPage(title: appTitle),
        SocketTestPage.routeName : (context) => SocketTestPage(title: 'Socket Test'),
        InternetAddressLookupPage.routeName : (context) => InternetAddressLookupPage(title: 'Internet Address Lookup'),
      },
    );
  }
}

class MenuPage extends StatelessWidget {
  static const routeName='/menu';
  final String title;
  const MenuPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListTile(
                title: const Center(
                  child: Text('Internet Address Lookup'),
                ),
                subtitle: const Center(
                  child: Text('Address to IP'),
                ),
                onTap: () {
                  Navigator.pushNamed(context, InternetAddressLookupPage.routeName);
                },
                shape: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
              ),
              const SizedBox(
                height: 8.0,
              ),
              ListTile(
                title: const Center(
                  child: Text('Socket Test'),
                ),
                subtitle: const Center(
                  child: Text('Socket connect test'),
                ),
                onTap: () {
                  Navigator.pushNamed(context, SocketTestPage.routeName);
                },
                shape: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
