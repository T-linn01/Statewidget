import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isStarted = false;

  void _handleButtonPress() {
    setState(() {
      _isStarted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text(
          "MyDog Playing Game!",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _isStarted
                ? Image.network(
              'https://i.pinimg.com/736x/5c/8a/3d/5c8a3d36fb0688b37a083709c3d667c4.jpg',
              width: 200,
              height: 200,
            )
                : const Text(
              "Play Game!",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 30),
            if (!_isStarted)
              ElevatedButton(
                onPressed: _handleButtonPress,
                child: const Text('Start'),
              ),
          ],
        ),
      ),
    );
  }
}
