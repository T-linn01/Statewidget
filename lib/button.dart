import 'package:flutter/material.dart';

// Điểm bắt đầu của ứng dụng Flutter
void main() => runApp(const MyApp());

// MyApp là widget gốc của ứng dụng
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Buttons Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const SimpleButtonScreen(),
    );
  }
}

class SimpleButtonScreen extends StatefulWidget {
  const SimpleButtonScreen({super.key});

  @override
  State<SimpleButtonScreen> createState() => _SimpleButtonScreenState();
}

class _SimpleButtonScreenState extends State<SimpleButtonScreen> {

  String _lastButtonPressed = "Chưa có button nào được nhấn.";
  void _updateButtonStatus(String buttonName) {
    setState(() {
      _lastButtonPressed = "Bạn đã nhấn: $buttonName";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BUTTONS"),
        backgroundColor: Colors.teal,
        actions: <Widget>[
          IconButton(icon:Icon(Icons.camera_alt), onPressed: () => {}),
          IconButton(icon:Icon(Icons.account_circle), onPressed: () => {}),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  _updateButtonStatus("ElevatedButton");
                },
                child: const Text('Click!! ElevatedButton'),
              ),
              const SizedBox(height: 15),

              TextButton(
                onPressed: () {
                  _updateButtonStatus("TextButton");
                },
                child: const Text('Click!! TextButton'),
              ),
              const SizedBox(height: 15),

              // OutlinedButton
              OutlinedButton(
                onPressed: () {
                  _updateButtonStatus("OutlinedButton");
                },
                child: const Text('Click!! OutlinedButton'),
              ),
              const SizedBox(height: 15),

              // IconButton
              IconButton(
                icon: const Icon(Icons.star),
                onPressed: () {
                  _updateButtonStatus("IconButton (Star)");
                },
                iconSize: 30.0,
                color: Colors.amber,
              ),
              const SizedBox(height: 30),

              Text(
                _lastButtonPressed,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      // FloatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _updateButtonStatus(' Click!! FloatingActionButton ');
        },
        child: const Icon(Icons.add), // Icon thêm
      ),
    );
  }
}
