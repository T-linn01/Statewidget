import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// Main application widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // Disable the debug banner
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        // App bar with a title
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: const Text(
            "Container",
            style: TextStyle(color: Colors.amberAccent),
          ),
        ),

        // Body of the scaffold with a container
        body: Container(

          // Height
          height: 500,

          // Width
          width: double.infinity,

          // Alignment
          alignment: Alignment.topCenter,

          // Margin
          margin: const EdgeInsets.all(20),

          // Padding
          padding: const EdgeInsets.all(50),

          // Removed the color property from here to avoid assertion error
          // color: Colors.green,
          decoration: BoxDecoration(

            // Use color here when using the decoration property
            //color: Colors.green,

            // Add rounded corners
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black, width: 3),
            image: DecorationImage(
                image: NetworkImage('https://i.pinimg.com/736x/50/30/d9/5030d961448768f1018e367e49805ab1.jpg'),
                fit: BoxFit.cover,
            )
          ),
          child: const Text(
            "Hello! I'm here!",
            style: TextStyle(fontSize: 20,
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}

