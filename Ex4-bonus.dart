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
          child: Container(
            width: 500,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildScoreCard('My score in Flutter', flutterScore, Colors.green.withOpacity(0.25)),
                SizedBox(height: 16.0),
                _buildScoreCard('My score in Dart', dartScore, Colors.green.withOpacity(0.5)),
                SizedBox(height: 16.0),
                _buildScoreCard('My score in React', reactScore, Colors.green),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScoreCard(String title, int score, Color color) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
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
            height: 20.0,
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
