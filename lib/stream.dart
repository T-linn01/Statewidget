import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      title: 'StreamBuilder Example',
      home: NumberStreamPage(),
    );
  }
}

class NumberStreamPage extends StatefulWidget {
  @override
  _NumberStreamPageState createState() => _NumberStreamPageState();
}

class _NumberStreamPageState extends State<NumberStreamPage> {
  late StreamController<int> _numberStreamController;

  @override
  void initState() {
    super.initState();


    _numberStreamController = StreamController<int>();
    _startAddingNumbers();
  }

  void _startAddingNumbers() async {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 2));
      _numberStreamController.sink.add(i);
    }
  }

  @override
  void dispose() {
    _numberStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamBuilder'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: _numberStreamController.stream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return Text('No data available');
            } else {
              return Text(
                'Latest Number: ${snapshot.data}',
                style: TextStyle(fontSize: 24),
              );
            }
          },
        ),
      ),
    );
  }
}