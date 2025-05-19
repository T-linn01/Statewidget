import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String message = 'Hello, World!';

  void _handleButtonPress(BuildContext context) {
    setState(() {
      message = 'Bạn vừa nhấn nút!';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Nút đã được nhấn!')),
    );

    print('Click!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _handleButtonPress(context),
              child: const Text('A button'),
            ),
          ],
        ),
      ),
    );
  }
}
