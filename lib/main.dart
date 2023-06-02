import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatelessWidget(),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blueGrey[900], // Background color
          onPrimary: Colors.white, // Text color
          padding: const EdgeInsets.symmetric(
              horizontal: 24, vertical: 12), // Button padding
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24)), // Button border radius
          elevation: 8, // Button shadow
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text('Flutter Tips'),
                    contentPadding: const EdgeInsets.all(20.0),
                    content: const Text('This is a Flutter Tips App'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Close'),
                      ),
                    ],
                  ));
        },
        child: const Text('Alert Me', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
