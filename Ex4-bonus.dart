import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int flutterScore = 0;
  int dartScore = 0;
  int reactScore = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Score Bar',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Score Bar'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildScoreCard('My score in Flutter', flutterScore, Colors.green),
              SizedBox(height: 16.0),
              _buildScoreCard('My score in Dart', dartScore, Colors.lightGreen),
              SizedBox(height: 16.0),
              _buildScoreCard('My score in React', reactScore, Color(0xFF006400)), // Use the Color constructor to create the dark green color
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScoreCard(String title, int score, Color color) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    score = (score > 0) ? score - 1 : 0;
                  });
                },
              ),
              Text('$score'),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    score = (score < 100) ? score + 1 : 100;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Container(
            height: 16.0,
            decoration: BoxDecoration(
              border: Border.all(
                color: score == 0 ? Colors.grey : color,
                width: 2.0,
              ),
              color: score == 0 ? Colors.transparent : color.withOpacity(score / 100),
            ),
          ),
        ],
      ),
    );
  }
}
