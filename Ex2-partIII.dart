import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Best Card',
      home: TheCardLayout(),
    );
  }
}

class TheCardLayout extends StatefulWidget {
  @override
  _TheCardLayoutState createState() => _TheCardLayoutState();
}

class _TheCardLayoutState extends State<TheCardLayout> {
  List<Map<String, String>> favoriteCards = [
    {'title': 'Card 1', 'description': 'This is the description for card 1'},
    {'title': 'Card 2', 'description': 'This is the description for card 2'},
    {'title': 'Card 3', 'description': 'This is the description for card 3'},
  ];

  List<bool> isFavorite = [false, false, false]; // Track favorite status

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite App'),
        backgroundColor: Colors.lightBlue, // Set AppBar color to light blue
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: favoriteCards.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // No border radius
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between title/description and icon
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  favoriteCards[index]['title']!,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(favoriteCards[index]['description']!),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isFavorite[index] = !isFavorite[index]; // Toggle favorite status
                              });
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: isFavorite[index] ? Colors.red : Colors.white, // Change color based on favorite status
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
