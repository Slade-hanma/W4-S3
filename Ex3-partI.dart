import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;
  List<String> imageUrls = [
    'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    'https://images.unsplash.com/photo-1470770903676-69b98201ea1c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    'https://images.unsplash.com/photo-1605540436563-5bca919ae766?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Gallery',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Gallery'),
          actions: [
            IconButton(
              icon: Text('<', style: TextStyle(fontSize: 24.0)),
              onPressed: previousImage,
            ),
            SizedBox(width: 8.0),
            IconButton(
              icon: Text('>', style: TextStyle(fontSize: 24.0)),
              onPressed: nextImage,
            ),
          ],
        ),
        body: Center(
          child: Image.network(imageUrls[currentIndex]),
        ),
      ),
    );
  }

  void previousImage() {
    setState(() {
      currentIndex = (currentIndex - 1) % imageUrls.length;
    });
  }

  void nextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % imageUrls.length;
    });
  }
}
/*
Q1 – What type of state do you need to keep?
The type of state which is to be keep in this case is the current index of the image being displayed. This means it is necessary to always know which image is currently being viewed and refresh it whenever the user flips through the gallery.

Q2 – Look at the current widget tree: which widget will you warp into your stateful widget?
In the Current setup, MyApp widget in it is entirely Stateful Widget, therefore you may retain it as the stateful widget handling the image gallery state.

When it comes to the circular carousel, one of the ways to manage this is to incorporate the modulo operator % to deal with the changing of indexes cyclically. 
*/